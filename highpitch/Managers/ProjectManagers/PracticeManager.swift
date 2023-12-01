//
//  PracticeManager.swift
//  highpitch
//
//  Created by yuncoffee on 10/19/23.
//

import Foundation

@Observable
final class PracticeManager {
    static var shared = PracticeManager()
}

extension PracticeManager {
    
    /// 해당 단어가 습관어인지 확인한다.
    static func isFillerWord(practice: PracticeModel, word: String) -> Bool {
        for (index, fillerWord) in practice.summary.eachFillerWordCount.enumerated() where
        word.last! == "." ? fillerWord.fillerWord + "." == word : fillerWord.fillerWord == word {
            // fillerWordCount, eachFillerWordCount를 업데이트합니다.
            practice.summary.fillerWordCount += 1
            practice.summary.eachFillerWordCount[index].count += 1
            return true
        }
        return false
    }
    
    /// eachFillerWordCount를 초기화한다.
    static func initializer(practice: PracticeModel) {
        for fillerWord in FillerWordList.userFillerWordList {
            practice.summary.eachFillerWordCount.append(FillerWordModel(fillerWord: fillerWord, count: 0))
        }
    }
    
    /// summary에 들어가는 data를 업데이트한다.
    static func updateSummary(practice: PracticeModel) {
        practice.summary.spmAverage =
        Double(practice.summary.syllableSum * 60000) / Double(practice.summary.durationSum)
        /// sentences 중 epmAverage와의 오차가 60 이상인 경우 저장한다.
        for sentence in practice.sentences {
            if sentence.spmValue < practice.summary.spmAverage - 100.0 {
                practice.summary.slowSentenceIndex.append(sentence.index)
                sentence.type = 2
            }
            if sentence.spmValue > practice.summary.spmAverage + 100.0 {
                practice.summary.fastSentenceIndex.append(sentence.index)
                sentence.type = 1
            }
            practice.summary.maxSpm = max(practice.summary.maxSpm, sentence.spmValue)
            practice.summary.minSpm = min(practice.summary.minSpm, sentence.spmValue)
        }
        practice.summary.fwpm = Double(practice.summary.fillerWordCount)
        / practice.summary.practiceLength * 60.0
    }
    
    // swiftlint:disable function_body_length
    static func getPracticeDetail(practice: PracticeModel) {
        #if DEBUG
        print("분석 시작")
        #endif
        initializer(practice: practice)
        /// sentenceIndex와 wordIndex, sentenceSyllable을 관리한다.
        var sentenceIndex = 0; var wordIndex = 0
        var sentenceSyllable: [Int] = [0]
        var sentenceDuration: [Int] = [0]
        var tempWords: [WordModel] = []
        var tempSentences: [SentenceModel] = []
        var fillerWordCount: Int = 0
        
        for (index, utterance) in practice.utterances.sorted().enumerated() {
            for word in utterance.message.components(separatedBy: " ") {
                /// word와 관련한 값을 업데이트한다.
                practice.summary.wordCount += 1
                practice.summary.syllableSum += word.count
                
                if sentenceIndex == sentenceSyllable.count - 1 { sentenceSyllable.append(0) }
                sentenceSyllable[sentenceIndex] += word.count
                if word.last! == "." {
                    practice.summary.syllableSum -= 1
                    sentenceSyllable[sentenceIndex] -= 1
                }
                
                /// words, sentences의 sentence를 업데이트한다.
                let itIsFillerWord = isFillerWord(practice: practice, word: word)
                if (itIsFillerWord) { fillerWordCount += 1 }
                tempWords.append(WordModel(
                    isFillerWord: itIsFillerWord,
                    sentenceIndex: sentenceIndex,
                    index: wordIndex,
                    word: word + " "))
                
                if sentenceIndex == tempSentences.count {
                    tempSentences.append(SentenceModel(
                        index: sentenceIndex,
                        sentence: word,
                        startAt: utterance.startAt
                    ))
                } else {
                    tempSentences[sentenceIndex].sentence += (" " + word)
                }
                
                /// 다음 단어로 넘어간다.
                wordIndex += 1
            }
            
            /// duration 및 endAt을 업데이트한다.
            tempSentences[sentenceIndex].endAt = utterance.startAt + utterance.duration
            if sentenceIndex == sentenceDuration.count - 1 { sentenceDuration.append(0) }
            sentenceDuration[sentenceIndex] += utterance.duration
            practice.summary.durationSum += utterance.duration
            
            /// 음절의 길이가 15가 넘거나, 마지막 문장이라면 문장을 끝낸다.
            if sentenceSyllable[sentenceIndex] > 15 || index == practice.utterances.count - 1 {
                
                /// EPM을 업데이트한다.
                tempSentences[sentenceIndex].spmValue =
                Double(sentenceSyllable[sentenceIndex] * 60000) / Double(sentenceDuration[sentenceIndex])
                /// FillerWordCount를 업데이트한다.
                tempSentences[sentenceIndex].fillerWordCount = fillerWordCount
                _ = tempWords.last!.word.popLast()
                for tempWord in tempWords { practice.words.append(tempWord) }
                tempWords.removeAll()
                practice.sentences.append(tempSentences[sentenceIndex])
                
                /// 다음 문장으로 넘긴다.
                sentenceIndex += 1
                fillerWordCount = 0
            }
        }
        updateSummary(practice: practice)
        SystemManager.shared.isAnalyzing = false
        SystemManager.shared.hasUnVisited = true
        #if DEBUG
        print("분석 완료")
        #endif
    }
    // swiftlint:enable function_body_length
}
