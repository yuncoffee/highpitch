//
//  SampleData.swift
//  highpitch
//
//  Created by yuncoffee on 12/2/23.
//

import Foundation

class ProjectMock {
    static var shared = ProjectMock()
    
    private init() {}
    
    let sampleProject = ProjectModel(
        projectName: "디자인스터디 디그다",
        creatAt: "2023. 12. 2. 오후 5:29",
        keynoteCreation: "temp"
    )
}

class SampleDigDaPracticesMock1 {
    static var shared = SampleDigDaPracticesMock1()
    
    private init() {
//        summary.maxSpm = 521.8471733278111
//        summary.minSpm = 270.8333333333333
//        practice.summary = self.summary
//        practice.utterances = self.utterance
//        practice.words = self.words
//        practice.sentences = self.sentences
    }
    
    let practice = PracticeModel(
        practiceName: "첫번째 연습",
        index: 0,
        isVisited: true,
        creatAt: "2023-12-02 17:49:41 GMT+09:00",
        audioPath: URL(fileURLWithPath: URL.getPath(fileName: "20231202174941", type: .audio).path()),
        videoPath: URL(fileURLWithPath: URL.getPath(fileName: "20231202174941", type: .video).path()),
        utterances: [],
        words: [],
        sentences: [],
        summary: PracticeSummaryModel(),
        remarkable: false,
        projectCreatAt: "2023. 12. 2. 오후 5:29"
    )
    
    var summary = PracticeSummaryModel(
        syllableSum: 367,
        durationSum: 6422,
        wordCount: 150,
        fillerWordCount: 7,
        eachFillerWordCount: [
            FillerWordModel(fillerWord:"아니", count: 0),
            FillerWordModel(fillerWord:"인제", count: 0),
            FillerWordModel(fillerWord:"아니아니", count: 0),
            FillerWordModel(fillerWord:"뭐였더라", count: 0),
            FillerWordModel(fillerWord:"그래서", count: 0),
            FillerWordModel(fillerWord:"뭔가", count: 0),
            FillerWordModel(fillerWord:"아", count: 0),
            FillerWordModel(fillerWord:"봐봐", count: 0),
            FillerWordModel(fillerWord:"어", count: 1),
            FillerWordModel(fillerWord:"저기", count: 0),
            FillerWordModel(fillerWord:"그러니까", count: 0),
            FillerWordModel(fillerWord:"약간", count: 0),
            FillerWordModel(fillerWord:"뭐였지", count: 0),
            FillerWordModel(fillerWord:"이제", count: 6),
            FillerWordModel(fillerWord:"음", count: 0),
            FillerWordModel(fillerWord:"흠", count: 0),
            FillerWordModel(fillerWord:"막", count: 0),
            FillerWordModel(fillerWord:"뭐", count: 0),
            FillerWordModel(fillerWord:"사실은", count: 0),
            FillerWordModel(fillerWord:"그니깐", count: 0),
            FillerWordModel(fillerWord:"뭐지", count: 0),
            FillerWordModel(fillerWord:"근데", count: 0)
        ],
        fastSentenceIndex: [2],
        slowSentenceIndex: [],
        spmAverage: 342.8464664393479,
        practiceLength: 85.6,
        fwpm: 4.906542056074767
    )
    var utterance = [
        UtteranceModel(
            startAt: 32640,
            duration: 4829,
            message: "제가 일주일간 스터드 를 모집 했었는데요 여러분들의 여러 관심 덕분에 최종 3 0 명의 오게 되었습니다."
        ),
        UtteranceModel(
            startAt: 22020,
            duration: 9300,
            message: "디그다 의 방향성을 간단하게 말씀드리고 앞으로 구결 동안에 스케줄에 대해서 설명해 드리도록 하겠습니다."
        ),
        UtteranceModel(
            startAt: 81390,
            duration: 2400,
            message: "이제 일정을 공유 해 드리도록 하겠습니다."
        ),
        UtteranceModel(
            startAt: 70860,
            duration: 8640,
            message: "이제 다양한 배경 들을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 등록 해 볼 수 있습니다."
        ),
        UtteranceModel(
            startAt: 45960,
            duration: 5730,
            message: "이제 그 한 사이클 의 총 8 개 주가 나오게 되겠죠 사이클 에 대한 설명은 뒤에서 제대로 하겠습니다."
        ),
        UtteranceModel(
            startAt: 19320,
            duration: 2159,
            message: "오늘 오리엔테이션 에서는."
        ),
        UtteranceModel(
            startAt: 10350,
            duration: 7770,
            message: "안녕하세요 여러분 아카데미 진행하는 D I 디자인 프로젝트 스터디 디그다 의 참여 의 신청 해줘서 감사합니다."
        ),
        UtteranceModel(
            startAt: 64470,
            duration: 5700,
            message: "이제 그 다양한 전공 분야를 가진 사람들이 모인 스터디기때문에."
        ),
        UtteranceModel(
            startAt: 38040,
            duration: 7109,
            message: "4 명 혹은 새벽시간 테마 이고 총 여덟 팀이나 되게 서영 이며 이제 싸이클 받아 각 팀별로 정해 공부한 내용들을 공개 예정입니다."
        ),
        UtteranceModel(
            startAt: 53280,
            duration: 10590,
            message: "이제 스터디 원들의 정보 문자 조사 결과 각각 개발 관련 1 9 % 기획 관련 2 5 % 디자인 관련 5 6 % 를 적고 있습니다 어 그 그 이처럼."
        )
    ]
    var words = [
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 100,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 147,
            word: "해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 38,
            word: "여러분들의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 18,
            word: "에서는.  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 91,
            word: "정보  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 11,
            word: "참여  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 115,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 107,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 75,
            word: "총  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 96,
            word: "개발  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 108,
            word: "5  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 73,
            word: "사이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 45,
            word: "명의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 62,
            word: "받아  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 148,
            word: "드리도록  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 5,
            index: 88,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 89,
            word: "스터디  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 23,
            word: "말씀드리고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 20,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 29,
            word: "설명해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 86,
            word: "제대로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 66,
            word: "공부한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 99,
            word: "9  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 65,
            word: "정해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 79,
            word: "나오게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 117,
            word: "이처럼. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 12,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 53,
            word: "이고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 128,
            word: "다양한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 109,
            word: "6  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 63,
            word: "각  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 126,
            word: "스터디기때문에. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 8,
            word: "스터디  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 5,
            word: "I  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 87,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 149,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 4,
            word: "D  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 32,
            word: "제가  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 33,
            word: "일주일간  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 49,
            word: "명  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 124,
            word: "사람들이  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 55,
            word: "여덟  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 3,
            word: "진행하는  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 34,
            word: "스터드  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 19,
            word: "디그다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 43,
            word: "3  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 98,
            word: "1  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 31,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 8,
            index: 144,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 2,
            word: "아카데미  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 132,
            word: "사람들과  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 104,
            word: "5  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 46,
            word: "오게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 94,
            word: "결과  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 93,
            word: "조사  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 113,
            word: "있습니다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 14,
            word: "해줘서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 129,
            word: "배경  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 102,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 6,
            word: "디자인  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 80,
            word: "되겠죠  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 106,
            word: "디자인  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 58,
            word: "서영  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 6,
            index: 118,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 97,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 51,
            word: "새벽시간  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 81,
            word: "사이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 69,
            word: "예정입니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 30,
            word: "드리도록  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 146,
            word: "공유  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 90,
            word: "원들의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 54,
            word: "총  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 71,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 68,
            word: "공개  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 140,
            word: "해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 116,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 50,
            word: "혹은  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 52,
            word: "테마  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 40,
            word: "관심  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 74,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 76,
            word: "8  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 84,
            word: "설명은  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 41,
            word: "덕분에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 48,
            word: "4  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 131,
            word: "가진  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 135,
            word: "관점에서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 105,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 85,
            word: "뒤에서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 78,
            word: "주가  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 1,
            word: "여러분  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 17,
            word: "오리엔테이션  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 139,
            word: "등록  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 24,
            word: "앞으로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 15,
            word: "감사합니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 57,
            word: "되게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 13,
            word: "신청  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 10,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 125,
            word: "모인  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 7,
            index: 127,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 26,
            word: "동안에  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 4,
            index: 70,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 77,
            word: "개  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 122,
            word: "분야를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 137,
            word: "바라  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 39,
            word: "여러  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 95,
            word: "각각  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 67,
            word: "내용들을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 25,
            word: "구결  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 42,
            word: "최종  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 121,
            word: "전공  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 7,
            word: "프로젝트  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 123,
            word: "가진  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 111,
            word: "를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 82,
            word: "에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 16,
            word: "오늘  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 5,
            index: 114,
            word: "어  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 120,
            word: "다양한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 0,
            word: "안녕하세요  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 83,
            word: "대한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 61,
            word: "싸이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 110,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 133,
            word: "서로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 103,
            word: "2  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 145,
            word: "일정을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 37,
            word: "했었는데요  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 92,
            word: "문자  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 56,
            word: "팀이나  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 35,
            word: "를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 141,
            word: "볼  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 64,
            word: "팀별로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 9,
            word: "디그다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 47,
            word: "되었습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 44,
            word: "0  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 112,
            word: "적고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 119,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 101,
            word: "기획  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 134,
            word: "다른  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 28,
            word: "대해서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 136,
            word: "주제를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 59,
            word: "이며  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 143,
            word: "있습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 138,
            word: "보고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 27,
            word: "스케줄에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 142,
            word: "수  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 130,
            word: "들을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 36,
            word: "모집  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 22,
            word: "간단하게  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 3,
            index: 60,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 72,
            word: "한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 21,
            word: "방향성을  "
        ),
    ]
    
    var sentences = [
        SentenceModel(
            index: 6,
            sentence: "이제 그 다양한 전공 분야를 가진 사람들이 모인 스터디기때문에.",
            startAt: 64470,
            endAt: 70170,
            spmValue: 273.6842105263158
        ),
        SentenceModel(
            index: 4,
            sentence: "이제 그 한 사이클 의 총 8 개 주가 나오게 되겠죠 사이클 에 대한 설명은 뒤에서 제대로 하겠습니다.",
            startAt: 45960,
            endAt: 51690,
            spmValue: 408.37696335078533
        ),
        SentenceModel(
            index: 2,
            sentence: "제가 일주일간 스터드 를 모집 했었는데요 여러분들의 여러 관심 덕분에 최종 3 0 명의 오게 되었습니다.",
            startAt: 32640,
            endAt: 37469,
            spmValue: 521.8471733278111
        ),
        SentenceModel(
            index: 8,
            sentence: "이제 일정을 공유 해 드리도록 하겠습니다.",
            startAt: 81390,
            endAt: 83790,
            spmValue: 425.0
        ),
        SentenceModel(
            index: 0,
            sentence: "안녕하세요 여러분 아카데미 진행하는 D I 디자인 프로젝트 스터디 디그다 의 참여 의 신청 해줘서 감사합니다.",
            startAt: 10350,
            endAt: 18120,
            spmValue: 347.4903474903475
        ),
        SentenceModel(
            index: 7,
            sentence: "이제 다양한 배경 들을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 등록 해 볼 수 있습니다.",
            startAt: 70860,
            endAt: 79500,
            spmValue: 270.8333333333333
        ),
        SentenceModel(
            index: 5,
            sentence: "이제 스터디 원들의 정보 문자 조사 결과 각각 개발 관련 1 9 % 기획 관련 2 5 % 디자인 관련 5 6 % 를 적고 있습니다 어 그 그 이처럼.",
            startAt: 53280,
            endAt: 63870,
            spmValue: 300.2832861189802
        ),
        SentenceModel(
            index: 1,
            sentence: "오늘 오리엔테이션 에서는. 디그다 의 방향성을 간단하게 말씀드리고 앞으로 구결 동안에 스케줄에 대해서 설명해 드리도록 하겠습니다.",
            startAt: 19320,
            endAt: 31320,
            spmValue: 287.98324461122263
        ),
        SentenceModel(
            index: 3,
            sentence: "4 명 혹은 새벽시간 테마 이고 총 여덟 팀이나 되게 서영 이며 이제 싸이클 받아 각 팀별로 정해 공부한 내용들을 공개 예정입니다.",
            startAt: 38040,
            endAt: 45149,
            spmValue: 430.4402869601913
        )
    ]
}

class SampleDigDaPracticesMock2 {
    static var shared = SampleDigDaPracticesMock2()
    
    private init() {
//        summary.maxSpm = 521.8471733278111
//        summary.minSpm = 270.8333333333333
//        practice.summary = self.summary
//        practice.utterances = self.utterance
//        practice.words = self.words
//        practice.sentences = self.sentences
    }
    
    let practice = PracticeModel(
        practiceName: "두번째 연습",
        index: 1,
        isVisited: true,
        creatAt: "2023-12-02 17:49:42 GMT+09:00",
        audioPath: URL(fileURLWithPath: URL.getPath(fileName: "20231202174941", type: .audio).path()),
        videoPath: URL(fileURLWithPath: URL.getPath(fileName: "20231202174941", type: .video).path()),
        utterances: [],
        words: [],
        sentences: [],
        summary: PracticeSummaryModel(),
        remarkable: false,
        projectCreatAt: "2023. 12. 2. 오후 5:29"
    )
    
    var summary = PracticeSummaryModel(
        syllableSum: 367,
        durationSum: 6422,
        wordCount: 150,
        fillerWordCount: 7,
        eachFillerWordCount: [
            FillerWordModel(fillerWord:"아니", count: 0),
            FillerWordModel(fillerWord:"인제", count: 0),
            FillerWordModel(fillerWord:"아니아니", count: 0),
            FillerWordModel(fillerWord:"뭐였더라", count: 0),
            FillerWordModel(fillerWord:"그래서", count: 0),
            FillerWordModel(fillerWord:"뭔가", count: 0),
            FillerWordModel(fillerWord:"아", count: 0),
            FillerWordModel(fillerWord:"봐봐", count: 0),
            FillerWordModel(fillerWord:"어", count: 1),
            FillerWordModel(fillerWord:"저기", count: 0),
            FillerWordModel(fillerWord:"그러니까", count: 0),
            FillerWordModel(fillerWord:"약간", count: 0),
            FillerWordModel(fillerWord:"뭐였지", count: 0),
            FillerWordModel(fillerWord:"이제", count: 6),
            FillerWordModel(fillerWord:"음", count: 0),
            FillerWordModel(fillerWord:"흠", count: 0),
            FillerWordModel(fillerWord:"막", count: 0),
            FillerWordModel(fillerWord:"뭐", count: 0),
            FillerWordModel(fillerWord:"사실은", count: 0),
            FillerWordModel(fillerWord:"그니깐", count: 0),
            FillerWordModel(fillerWord:"뭐지", count: 0),
            FillerWordModel(fillerWord:"근데", count: 0)
        ],
        fastSentenceIndex: [2],
        slowSentenceIndex: [],
        spmAverage: 342.8464664393479,
        practiceLength: 85.6,
        fwpm: 4.906542056074767
    )
    var utterance = [
        UtteranceModel(
            startAt: 32640,
            duration: 4829,
            message: "제가 일주일간 스터드 를 모집 했었는데요 여러분들의 여러 관심 덕분에 최종 3 0 명의 오게 되었습니다."
        ),
        UtteranceModel(
            startAt: 22020,
            duration: 9300,
            message: "디그다 의 방향성을 간단하게 말씀드리고 앞으로 구결 동안에 스케줄에 대해서 설명해 드리도록 하겠습니다."
        ),
        UtteranceModel(
            startAt: 81390,
            duration: 2400,
            message: "이제 일정을 공유 해 드리도록 하겠습니다."
        ),
        UtteranceModel(
            startAt: 70860,
            duration: 8640,
            message: "이제 다양한 배경 들을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 등록 해 볼 수 있습니다."
        ),
        UtteranceModel(
            startAt: 45960,
            duration: 5730,
            message: "이제 그 한 사이클 의 총 8 개 주가 나오게 되겠죠 사이클 에 대한 설명은 뒤에서 제대로 하겠습니다."
        ),
        UtteranceModel(
            startAt: 19320,
            duration: 2159,
            message: "오늘 오리엔테이션 에서는."
        ),
        UtteranceModel(
            startAt: 10350,
            duration: 7770,
            message: "안녕하세요 여러분 아카데미 진행하는 D I 디자인 프로젝트 스터디 디그다 의 참여 의 신청 해줘서 감사합니다."
        ),
        UtteranceModel(
            startAt: 64470,
            duration: 5700,
            message: "이제 그 다양한 전공 분야를 가진 사람들이 모인 스터디기때문에."
        ),
        UtteranceModel(
            startAt: 38040,
            duration: 7109,
            message: "4 명 혹은 새벽시간 테마 이고 총 여덟 팀이나 되게 서영 이며 이제 싸이클 받아 각 팀별로 정해 공부한 내용들을 공개 예정입니다."
        ),
        UtteranceModel(
            startAt: 53280,
            duration: 10590,
            message: "이제 스터디 원들의 정보 문자 조사 결과 각각 개발 관련 1 9 % 기획 관련 2 5 % 디자인 관련 5 6 % 를 적고 있습니다 어 그 그 이처럼."
        )
    ]
    var words = [
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 100,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 147,
            word: "해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 38,
            word: "여러분들의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 18,
            word: "에서는.  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 91,
            word: "정보  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 11,
            word: "참여  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 115,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 107,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 75,
            word: "총  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 96,
            word: "개발  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 108,
            word: "5  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 73,
            word: "사이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 45,
            word: "명의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 62,
            word: "받아  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 148,
            word: "드리도록  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 5,
            index: 88,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 89,
            word: "스터디  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 23,
            word: "말씀드리고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 20,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 29,
            word: "설명해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 86,
            word: "제대로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 66,
            word: "공부한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 99,
            word: "9  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 65,
            word: "정해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 79,
            word: "나오게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 117,
            word: "이처럼. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 12,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 53,
            word: "이고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 128,
            word: "다양한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 109,
            word: "6  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 63,
            word: "각  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 126,
            word: "스터디기때문에. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 8,
            word: "스터디  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 5,
            word: "I  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 87,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 149,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 4,
            word: "D  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 32,
            word: "제가  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 33,
            word: "일주일간  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 49,
            word: "명  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 124,
            word: "사람들이  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 55,
            word: "여덟  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 3,
            word: "진행하는  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 34,
            word: "스터드  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 19,
            word: "디그다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 43,
            word: "3  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 98,
            word: "1  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 31,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 8,
            index: 144,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 2,
            word: "아카데미  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 132,
            word: "사람들과  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 104,
            word: "5  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 46,
            word: "오게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 94,
            word: "결과  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 93,
            word: "조사  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 113,
            word: "있습니다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 14,
            word: "해줘서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 129,
            word: "배경  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 102,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 6,
            word: "디자인  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 80,
            word: "되겠죠  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 106,
            word: "디자인  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 58,
            word: "서영  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 6,
            index: 118,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 97,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 51,
            word: "새벽시간  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 81,
            word: "사이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 69,
            word: "예정입니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 30,
            word: "드리도록  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 146,
            word: "공유  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 90,
            word: "원들의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 54,
            word: "총  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 71,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 68,
            word: "공개  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 140,
            word: "해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 116,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 50,
            word: "혹은  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 52,
            word: "테마  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 40,
            word: "관심  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 74,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 76,
            word: "8  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 84,
            word: "설명은  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 41,
            word: "덕분에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 48,
            word: "4  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 131,
            word: "가진  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 135,
            word: "관점에서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 105,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 85,
            word: "뒤에서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 78,
            word: "주가  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 1,
            word: "여러분  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 17,
            word: "오리엔테이션  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 139,
            word: "등록  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 24,
            word: "앞으로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 15,
            word: "감사합니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 57,
            word: "되게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 13,
            word: "신청  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 10,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 125,
            word: "모인  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 7,
            index: 127,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 26,
            word: "동안에  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 4,
            index: 70,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 77,
            word: "개  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 122,
            word: "분야를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 137,
            word: "바라  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 39,
            word: "여러  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 95,
            word: "각각  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 67,
            word: "내용들을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 25,
            word: "구결  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 42,
            word: "최종  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 121,
            word: "전공  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 7,
            word: "프로젝트  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 123,
            word: "가진  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 111,
            word: "를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 82,
            word: "에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 16,
            word: "오늘  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 5,
            index: 114,
            word: "어  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 120,
            word: "다양한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 0,
            word: "안녕하세요  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 83,
            word: "대한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 61,
            word: "싸이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 110,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 133,
            word: "서로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 103,
            word: "2  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 145,
            word: "일정을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 37,
            word: "했었는데요  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 92,
            word: "문자  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 56,
            word: "팀이나  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 35,
            word: "를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 141,
            word: "볼  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 64,
            word: "팀별로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 9,
            word: "디그다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 47,
            word: "되었습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 44,
            word: "0  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 112,
            word: "적고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 119,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 101,
            word: "기획  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 134,
            word: "다른  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 28,
            word: "대해서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 136,
            word: "주제를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 59,
            word: "이며  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 143,
            word: "있습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 138,
            word: "보고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 27,
            word: "스케줄에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 142,
            word: "수  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 130,
            word: "들을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 36,
            word: "모집  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 22,
            word: "간단하게  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 3,
            index: 60,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 72,
            word: "한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 21,
            word: "방향성을  "
        ),
    ]
    
    var sentences = [
        SentenceModel(
            index: 6,
            sentence: "이제 그 다양한 전공 분야를 가진 사람들이 모인 스터디기때문에.",
            startAt: 64470,
            endAt: 70170,
            spmValue: 273.6842105263158
        ),
        SentenceModel(
            index: 4,
            sentence: "이제 그 한 사이클 의 총 8 개 주가 나오게 되겠죠 사이클 에 대한 설명은 뒤에서 제대로 하겠습니다.",
            startAt: 45960,
            endAt: 51690,
            spmValue: 408.37696335078533
        ),
        SentenceModel(
            index: 2,
            sentence: "제가 일주일간 스터드 를 모집 했었는데요 여러분들의 여러 관심 덕분에 최종 3 0 명의 오게 되었습니다.",
            startAt: 32640,
            endAt: 37469,
            spmValue: 521.8471733278111
        ),
        SentenceModel(
            index: 8,
            sentence: "이제 일정을 공유 해 드리도록 하겠습니다.",
            startAt: 81390,
            endAt: 83790,
            spmValue: 425.0
        ),
        SentenceModel(
            index: 0,
            sentence: "안녕하세요 여러분 아카데미 진행하는 D I 디자인 프로젝트 스터디 디그다 의 참여 의 신청 해줘서 감사합니다.",
            startAt: 10350,
            endAt: 18120,
            spmValue: 347.4903474903475
        ),
        SentenceModel(
            index: 7,
            sentence: "이제 다양한 배경 들을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 등록 해 볼 수 있습니다.",
            startAt: 70860,
            endAt: 79500,
            spmValue: 270.8333333333333
        ),
        SentenceModel(
            index: 5,
            sentence: "이제 스터디 원들의 정보 문자 조사 결과 각각 개발 관련 1 9 % 기획 관련 2 5 % 디자인 관련 5 6 % 를 적고 있습니다 어 그 그 이처럼.",
            startAt: 53280,
            endAt: 63870,
            spmValue: 300.2832861189802
        ),
        SentenceModel(
            index: 1,
            sentence: "오늘 오리엔테이션 에서는. 디그다 의 방향성을 간단하게 말씀드리고 앞으로 구결 동안에 스케줄에 대해서 설명해 드리도록 하겠습니다.",
            startAt: 19320,
            endAt: 31320,
            spmValue: 287.98324461122263
        ),
        SentenceModel(
            index: 3,
            sentence: "4 명 혹은 새벽시간 테마 이고 총 여덟 팀이나 되게 서영 이며 이제 싸이클 받아 각 팀별로 정해 공부한 내용들을 공개 예정입니다.",
            startAt: 38040,
            endAt: 45149,
            spmValue: 430.4402869601913
        )
    ]
}

class SampleDigDaPracticesMock3 {
    static var shared = SampleDigDaPracticesMock3()
    
    private init() {
//        summary.maxSpm = 521.8471733278111
//        summary.minSpm = 270.8333333333333
//        practice.summary = self.summary
//        practice.utterances = self.utterance
//        practice.words = self.words
//        practice.sentences = self.sentences
    }
    
    let practice = PracticeModel(
        practiceName: "세번째 연습",
        index: 2,
        isVisited: true,
        creatAt: "2023-12-02 17:49:43 GMT+09:00",
        audioPath: URL(fileURLWithPath: URL.getPath(fileName: "20231202174941", type: .audio).path()),
        videoPath: URL(fileURLWithPath: URL.getPath(fileName: "20231202174941", type: .video).path()),
        utterances: [],
        words: [],
        sentences: [],
        summary: PracticeSummaryModel(),
        remarkable: false,
        projectCreatAt: "2023. 12. 2. 오후 5:29"
    )
    
    var summary = PracticeSummaryModel(
        syllableSum: 367,
        durationSum: 6422,
        wordCount: 150,
        fillerWordCount: 7,
        eachFillerWordCount: [
            FillerWordModel(fillerWord:"아니", count: 0),
            FillerWordModel(fillerWord:"인제", count: 0),
            FillerWordModel(fillerWord:"아니아니", count: 0),
            FillerWordModel(fillerWord:"뭐였더라", count: 0),
            FillerWordModel(fillerWord:"그래서", count: 0),
            FillerWordModel(fillerWord:"뭔가", count: 0),
            FillerWordModel(fillerWord:"아", count: 0),
            FillerWordModel(fillerWord:"봐봐", count: 0),
            FillerWordModel(fillerWord:"어", count: 1),
            FillerWordModel(fillerWord:"저기", count: 0),
            FillerWordModel(fillerWord:"그러니까", count: 0),
            FillerWordModel(fillerWord:"약간", count: 0),
            FillerWordModel(fillerWord:"뭐였지", count: 0),
            FillerWordModel(fillerWord:"이제", count: 6),
            FillerWordModel(fillerWord:"음", count: 0),
            FillerWordModel(fillerWord:"흠", count: 0),
            FillerWordModel(fillerWord:"막", count: 0),
            FillerWordModel(fillerWord:"뭐", count: 0),
            FillerWordModel(fillerWord:"사실은", count: 0),
            FillerWordModel(fillerWord:"그니깐", count: 0),
            FillerWordModel(fillerWord:"뭐지", count: 0),
            FillerWordModel(fillerWord:"근데", count: 0)
        ],
        fastSentenceIndex: [2],
        slowSentenceIndex: [],
        spmAverage: 342.8464664393479,
        practiceLength: 85.6,
        fwpm: 4.906542056074767
    )
    var utterance = [
        UtteranceModel(
            startAt: 32640,
            duration: 4829,
            message: "제가 일주일간 스터드 를 모집 했었는데요 여러분들의 여러 관심 덕분에 최종 3 0 명의 오게 되었습니다."
        ),
        UtteranceModel(
            startAt: 22020,
            duration: 9300,
            message: "디그다 의 방향성을 간단하게 말씀드리고 앞으로 구결 동안에 스케줄에 대해서 설명해 드리도록 하겠습니다."
        ),
        UtteranceModel(
            startAt: 81390,
            duration: 2400,
            message: "이제 일정을 공유 해 드리도록 하겠습니다."
        ),
        UtteranceModel(
            startAt: 70860,
            duration: 8640,
            message: "이제 다양한 배경 들을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 등록 해 볼 수 있습니다."
        ),
        UtteranceModel(
            startAt: 45960,
            duration: 5730,
            message: "이제 그 한 사이클 의 총 8 개 주가 나오게 되겠죠 사이클 에 대한 설명은 뒤에서 제대로 하겠습니다."
        ),
        UtteranceModel(
            startAt: 19320,
            duration: 2159,
            message: "오늘 오리엔테이션 에서는."
        ),
        UtteranceModel(
            startAt: 10350,
            duration: 7770,
            message: "안녕하세요 여러분 아카데미 진행하는 D I 디자인 프로젝트 스터디 디그다 의 참여 의 신청 해줘서 감사합니다."
        ),
        UtteranceModel(
            startAt: 64470,
            duration: 5700,
            message: "이제 그 다양한 전공 분야를 가진 사람들이 모인 스터디기때문에."
        ),
        UtteranceModel(
            startAt: 38040,
            duration: 7109,
            message: "4 명 혹은 새벽시간 테마 이고 총 여덟 팀이나 되게 서영 이며 이제 싸이클 받아 각 팀별로 정해 공부한 내용들을 공개 예정입니다."
        ),
        UtteranceModel(
            startAt: 53280,
            duration: 10590,
            message: "이제 스터디 원들의 정보 문자 조사 결과 각각 개발 관련 1 9 % 기획 관련 2 5 % 디자인 관련 5 6 % 를 적고 있습니다 어 그 그 이처럼."
        )
    ]
    var words = [
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 100,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 147,
            word: "해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 38,
            word: "여러분들의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 18,
            word: "에서는.  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 91,
            word: "정보  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 11,
            word: "참여  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 115,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 107,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 75,
            word: "총  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 96,
            word: "개발  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 108,
            word: "5  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 73,
            word: "사이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 45,
            word: "명의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 62,
            word: "받아  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 148,
            word: "드리도록  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 5,
            index: 88,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 89,
            word: "스터디  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 23,
            word: "말씀드리고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 20,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 29,
            word: "설명해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 86,
            word: "제대로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 66,
            word: "공부한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 99,
            word: "9  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 65,
            word: "정해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 79,
            word: "나오게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 117,
            word: "이처럼. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 12,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 53,
            word: "이고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 128,
            word: "다양한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 109,
            word: "6  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 63,
            word: "각  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 126,
            word: "스터디기때문에. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 8,
            word: "스터디  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 5,
            word: "I  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 87,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 149,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 4,
            word: "D  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 32,
            word: "제가  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 33,
            word: "일주일간  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 49,
            word: "명  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 124,
            word: "사람들이  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 55,
            word: "여덟  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 3,
            word: "진행하는  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 34,
            word: "스터드  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 19,
            word: "디그다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 43,
            word: "3  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 98,
            word: "1  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 31,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 8,
            index: 144,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 2,
            word: "아카데미  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 132,
            word: "사람들과  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 104,
            word: "5  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 46,
            word: "오게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 94,
            word: "결과  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 93,
            word: "조사  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 113,
            word: "있습니다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 14,
            word: "해줘서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 129,
            word: "배경  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 102,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 6,
            word: "디자인  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 80,
            word: "되겠죠  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 106,
            word: "디자인  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 58,
            word: "서영  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 6,
            index: 118,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 97,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 51,
            word: "새벽시간  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 81,
            word: "사이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 69,
            word: "예정입니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 30,
            word: "드리도록  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 146,
            word: "공유  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 90,
            word: "원들의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 54,
            word: "총  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 71,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 68,
            word: "공개  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 140,
            word: "해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 116,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 50,
            word: "혹은  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 52,
            word: "테마  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 40,
            word: "관심  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 74,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 76,
            word: "8  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 84,
            word: "설명은  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 41,
            word: "덕분에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 48,
            word: "4  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 131,
            word: "가진  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 135,
            word: "관점에서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 105,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 85,
            word: "뒤에서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 78,
            word: "주가  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 1,
            word: "여러분  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 17,
            word: "오리엔테이션  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 139,
            word: "등록  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 24,
            word: "앞으로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 15,
            word: "감사합니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 57,
            word: "되게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 13,
            word: "신청  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 10,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 125,
            word: "모인  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 7,
            index: 127,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 26,
            word: "동안에  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 4,
            index: 70,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 77,
            word: "개  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 122,
            word: "분야를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 137,
            word: "바라  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 39,
            word: "여러  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 95,
            word: "각각  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 67,
            word: "내용들을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 25,
            word: "구결  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 42,
            word: "최종  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 121,
            word: "전공  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 7,
            word: "프로젝트  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 123,
            word: "가진  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 111,
            word: "를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 82,
            word: "에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 16,
            word: "오늘  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 5,
            index: 114,
            word: "어  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 120,
            word: "다양한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 0,
            word: "안녕하세요  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 83,
            word: "대한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 61,
            word: "싸이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 110,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 133,
            word: "서로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 103,
            word: "2  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 145,
            word: "일정을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 37,
            word: "했었는데요  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 92,
            word: "문자  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 56,
            word: "팀이나  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 35,
            word: "를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 141,
            word: "볼  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 64,
            word: "팀별로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 9,
            word: "디그다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 47,
            word: "되었습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 44,
            word: "0  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 112,
            word: "적고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 119,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 101,
            word: "기획  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 134,
            word: "다른  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 28,
            word: "대해서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 136,
            word: "주제를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 59,
            word: "이며  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 143,
            word: "있습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 138,
            word: "보고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 27,
            word: "스케줄에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 142,
            word: "수  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 130,
            word: "들을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 36,
            word: "모집  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 22,
            word: "간단하게  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 3,
            index: 60,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 72,
            word: "한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 21,
            word: "방향성을  "
        ),
    ]
    
    var sentences = [
        SentenceModel(
            index: 6,
            sentence: "이제 그 다양한 전공 분야를 가진 사람들이 모인 스터디기때문에.",
            startAt: 64470,
            endAt: 70170,
            spmValue: 273.6842105263158
        ),
        SentenceModel(
            index: 4,
            sentence: "이제 그 한 사이클 의 총 8 개 주가 나오게 되겠죠 사이클 에 대한 설명은 뒤에서 제대로 하겠습니다.",
            startAt: 45960,
            endAt: 51690,
            spmValue: 408.37696335078533
        ),
        SentenceModel(
            index: 2,
            sentence: "제가 일주일간 스터드 를 모집 했었는데요 여러분들의 여러 관심 덕분에 최종 3 0 명의 오게 되었습니다.",
            startAt: 32640,
            endAt: 37469,
            spmValue: 521.8471733278111
        ),
        SentenceModel(
            index: 8,
            sentence: "이제 일정을 공유 해 드리도록 하겠습니다.",
            startAt: 81390,
            endAt: 83790,
            spmValue: 425.0
        ),
        SentenceModel(
            index: 0,
            sentence: "안녕하세요 여러분 아카데미 진행하는 D I 디자인 프로젝트 스터디 디그다 의 참여 의 신청 해줘서 감사합니다.",
            startAt: 10350,
            endAt: 18120,
            spmValue: 347.4903474903475
        ),
        SentenceModel(
            index: 7,
            sentence: "이제 다양한 배경 들을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 등록 해 볼 수 있습니다.",
            startAt: 70860,
            endAt: 79500,
            spmValue: 270.8333333333333
        ),
        SentenceModel(
            index: 5,
            sentence: "이제 스터디 원들의 정보 문자 조사 결과 각각 개발 관련 1 9 % 기획 관련 2 5 % 디자인 관련 5 6 % 를 적고 있습니다 어 그 그 이처럼.",
            startAt: 53280,
            endAt: 63870,
            spmValue: 300.2832861189802
        ),
        SentenceModel(
            index: 1,
            sentence: "오늘 오리엔테이션 에서는. 디그다 의 방향성을 간단하게 말씀드리고 앞으로 구결 동안에 스케줄에 대해서 설명해 드리도록 하겠습니다.",
            startAt: 19320,
            endAt: 31320,
            spmValue: 287.98324461122263
        ),
        SentenceModel(
            index: 3,
            sentence: "4 명 혹은 새벽시간 테마 이고 총 여덟 팀이나 되게 서영 이며 이제 싸이클 받아 각 팀별로 정해 공부한 내용들을 공개 예정입니다.",
            startAt: 38040,
            endAt: 45149,
            spmValue: 430.4402869601913
        )
    ]
}

class SampleDigDaPracticesMock4 {
    static var shared = SampleDigDaPracticesMock4()
    
    private init() {
//        summary.maxSpm = 521.8471733278111
//        summary.minSpm = 270.8333333333333
//        practice.summary = self.summary
//        practice.utterances = self.utterance
//        practice.words = self.words
//        practice.sentences = self.sentences
    }
    
    let practice = PracticeModel(
        practiceName: "네번째 연습",
        index: 3,
        isVisited: true,
        creatAt: "2023-12-02 17:49:44 GMT+09:00",
        audioPath: URL(fileURLWithPath: URL.getPath(fileName: "20231202174941", type: .audio).path()),
        videoPath: URL(fileURLWithPath: URL.getPath(fileName: "20231202174941", type: .video).path()),
        utterances: [],
        words: [],
        sentences: [],
        summary: PracticeSummaryModel(),
        remarkable: false,
        projectCreatAt: "2023. 12. 2. 오후 5:29"
    )
    
    var summary = PracticeSummaryModel(
        syllableSum: 367,
        durationSum: 6422,
        wordCount: 150,
        fillerWordCount: 7,
        eachFillerWordCount: [
            FillerWordModel(fillerWord:"아니", count: 0),
            FillerWordModel(fillerWord:"인제", count: 0),
            FillerWordModel(fillerWord:"아니아니", count: 0),
            FillerWordModel(fillerWord:"뭐였더라", count: 0),
            FillerWordModel(fillerWord:"그래서", count: 0),
            FillerWordModel(fillerWord:"뭔가", count: 0),
            FillerWordModel(fillerWord:"아", count: 0),
            FillerWordModel(fillerWord:"봐봐", count: 0),
            FillerWordModel(fillerWord:"어", count: 1),
            FillerWordModel(fillerWord:"저기", count: 0),
            FillerWordModel(fillerWord:"그러니까", count: 0),
            FillerWordModel(fillerWord:"약간", count: 0),
            FillerWordModel(fillerWord:"뭐였지", count: 0),
            FillerWordModel(fillerWord:"이제", count: 6),
            FillerWordModel(fillerWord:"음", count: 0),
            FillerWordModel(fillerWord:"흠", count: 0),
            FillerWordModel(fillerWord:"막", count: 0),
            FillerWordModel(fillerWord:"뭐", count: 0),
            FillerWordModel(fillerWord:"사실은", count: 0),
            FillerWordModel(fillerWord:"그니깐", count: 0),
            FillerWordModel(fillerWord:"뭐지", count: 0),
            FillerWordModel(fillerWord:"근데", count: 0)
        ],
        fastSentenceIndex: [2],
        slowSentenceIndex: [],
        spmAverage: 342.8464664393479,
        practiceLength: 85.6,
        fwpm: 4.906542056074767
    )
    var utterance = [
        UtteranceModel(
            startAt: 32640,
            duration: 4829,
            message: "제가 일주일간 스터드 를 모집 했었는데요 여러분들의 여러 관심 덕분에 최종 3 0 명의 오게 되었습니다."
        ),
        UtteranceModel(
            startAt: 22020,
            duration: 9300,
            message: "디그다 의 방향성을 간단하게 말씀드리고 앞으로 구결 동안에 스케줄에 대해서 설명해 드리도록 하겠습니다."
        ),
        UtteranceModel(
            startAt: 81390,
            duration: 2400,
            message: "이제 일정을 공유 해 드리도록 하겠습니다."
        ),
        UtteranceModel(
            startAt: 70860,
            duration: 8640,
            message: "이제 다양한 배경 들을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 등록 해 볼 수 있습니다."
        ),
        UtteranceModel(
            startAt: 45960,
            duration: 5730,
            message: "이제 그 한 사이클 의 총 8 개 주가 나오게 되겠죠 사이클 에 대한 설명은 뒤에서 제대로 하겠습니다."
        ),
        UtteranceModel(
            startAt: 19320,
            duration: 2159,
            message: "오늘 오리엔테이션 에서는."
        ),
        UtteranceModel(
            startAt: 10350,
            duration: 7770,
            message: "안녕하세요 여러분 아카데미 진행하는 D I 디자인 프로젝트 스터디 디그다 의 참여 의 신청 해줘서 감사합니다."
        ),
        UtteranceModel(
            startAt: 64470,
            duration: 5700,
            message: "이제 그 다양한 전공 분야를 가진 사람들이 모인 스터디기때문에."
        ),
        UtteranceModel(
            startAt: 38040,
            duration: 7109,
            message: "4 명 혹은 새벽시간 테마 이고 총 여덟 팀이나 되게 서영 이며 이제 싸이클 받아 각 팀별로 정해 공부한 내용들을 공개 예정입니다."
        ),
        UtteranceModel(
            startAt: 53280,
            duration: 10590,
            message: "이제 스터디 원들의 정보 문자 조사 결과 각각 개발 관련 1 9 % 기획 관련 2 5 % 디자인 관련 5 6 % 를 적고 있습니다 어 그 그 이처럼."
        )
    ]
    var words = [
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 100,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 147,
            word: "해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 38,
            word: "여러분들의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 18,
            word: "에서는.  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 91,
            word: "정보  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 11,
            word: "참여  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 115,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 107,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 75,
            word: "총  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 96,
            word: "개발  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 108,
            word: "5  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 73,
            word: "사이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 45,
            word: "명의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 62,
            word: "받아  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 148,
            word: "드리도록  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 5,
            index: 88,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 89,
            word: "스터디  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 23,
            word: "말씀드리고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 20,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 29,
            word: "설명해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 86,
            word: "제대로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 66,
            word: "공부한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 99,
            word: "9  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 65,
            word: "정해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 79,
            word: "나오게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 117,
            word: "이처럼. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 12,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 53,
            word: "이고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 128,
            word: "다양한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 109,
            word: "6  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 63,
            word: "각  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 126,
            word: "스터디기때문에. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 8,
            word: "스터디  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 5,
            word: "I  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 87,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 149,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 4,
            word: "D  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 32,
            word: "제가  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 33,
            word: "일주일간  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 49,
            word: "명  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 124,
            word: "사람들이  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 55,
            word: "여덟  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 3,
            word: "진행하는  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 34,
            word: "스터드  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 19,
            word: "디그다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 43,
            word: "3  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 98,
            word: "1  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 31,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 8,
            index: 144,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 2,
            word: "아카데미  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 132,
            word: "사람들과  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 104,
            word: "5  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 46,
            word: "오게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 94,
            word: "결과  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 93,
            word: "조사  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 113,
            word: "있습니다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 14,
            word: "해줘서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 129,
            word: "배경  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 102,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 6,
            word: "디자인  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 80,
            word: "되겠죠  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 106,
            word: "디자인  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 58,
            word: "서영  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 6,
            index: 118,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 97,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 51,
            word: "새벽시간  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 81,
            word: "사이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 69,
            word: "예정입니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 30,
            word: "드리도록  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 146,
            word: "공유  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 90,
            word: "원들의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 54,
            word: "총  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 71,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 68,
            word: "공개  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 140,
            word: "해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 116,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 50,
            word: "혹은  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 52,
            word: "테마  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 40,
            word: "관심  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 74,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 76,
            word: "8  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 84,
            word: "설명은  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 41,
            word: "덕분에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 48,
            word: "4  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 131,
            word: "가진  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 135,
            word: "관점에서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 105,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 85,
            word: "뒤에서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 78,
            word: "주가  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 1,
            word: "여러분  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 17,
            word: "오리엔테이션  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 139,
            word: "등록  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 24,
            word: "앞으로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 15,
            word: "감사합니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 57,
            word: "되게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 13,
            word: "신청  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 10,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 125,
            word: "모인  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 7,
            index: 127,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 26,
            word: "동안에  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 4,
            index: 70,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 77,
            word: "개  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 122,
            word: "분야를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 137,
            word: "바라  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 39,
            word: "여러  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 95,
            word: "각각  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 67,
            word: "내용들을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 25,
            word: "구결  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 42,
            word: "최종  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 121,
            word: "전공  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 7,
            word: "프로젝트  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 123,
            word: "가진  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 111,
            word: "를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 82,
            word: "에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 16,
            word: "오늘  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 5,
            index: 114,
            word: "어  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 120,
            word: "다양한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 0,
            word: "안녕하세요  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 83,
            word: "대한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 61,
            word: "싸이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 110,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 133,
            word: "서로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 103,
            word: "2  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 145,
            word: "일정을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 37,
            word: "했었는데요  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 92,
            word: "문자  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 56,
            word: "팀이나  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 35,
            word: "를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 141,
            word: "볼  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 64,
            word: "팀별로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 9,
            word: "디그다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 47,
            word: "되었습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 44,
            word: "0  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 112,
            word: "적고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 119,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 101,
            word: "기획  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 134,
            word: "다른  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 28,
            word: "대해서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 136,
            word: "주제를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 59,
            word: "이며  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 143,
            word: "있습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 138,
            word: "보고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 27,
            word: "스케줄에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 142,
            word: "수  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 130,
            word: "들을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 36,
            word: "모집  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 22,
            word: "간단하게  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 3,
            index: 60,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 72,
            word: "한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 21,
            word: "방향성을  "
        ),
    ]
    
    var sentences = [
        SentenceModel(
            index: 6,
            sentence: "이제 그 다양한 전공 분야를 가진 사람들이 모인 스터디기때문에.",
            startAt: 64470,
            endAt: 70170,
            spmValue: 273.6842105263158
        ),
        SentenceModel(
            index: 4,
            sentence: "이제 그 한 사이클 의 총 8 개 주가 나오게 되겠죠 사이클 에 대한 설명은 뒤에서 제대로 하겠습니다.",
            startAt: 45960,
            endAt: 51690,
            spmValue: 408.37696335078533
        ),
        SentenceModel(
            index: 2,
            sentence: "제가 일주일간 스터드 를 모집 했었는데요 여러분들의 여러 관심 덕분에 최종 3 0 명의 오게 되었습니다.",
            startAt: 32640,
            endAt: 37469,
            spmValue: 521.8471733278111
        ),
        SentenceModel(
            index: 8,
            sentence: "이제 일정을 공유 해 드리도록 하겠습니다.",
            startAt: 81390,
            endAt: 83790,
            spmValue: 425.0
        ),
        SentenceModel(
            index: 0,
            sentence: "안녕하세요 여러분 아카데미 진행하는 D I 디자인 프로젝트 스터디 디그다 의 참여 의 신청 해줘서 감사합니다.",
            startAt: 10350,
            endAt: 18120,
            spmValue: 347.4903474903475
        ),
        SentenceModel(
            index: 7,
            sentence: "이제 다양한 배경 들을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 등록 해 볼 수 있습니다.",
            startAt: 70860,
            endAt: 79500,
            spmValue: 270.8333333333333
        ),
        SentenceModel(
            index: 5,
            sentence: "이제 스터디 원들의 정보 문자 조사 결과 각각 개발 관련 1 9 % 기획 관련 2 5 % 디자인 관련 5 6 % 를 적고 있습니다 어 그 그 이처럼.",
            startAt: 53280,
            endAt: 63870,
            spmValue: 300.2832861189802
        ),
        SentenceModel(
            index: 1,
            sentence: "오늘 오리엔테이션 에서는. 디그다 의 방향성을 간단하게 말씀드리고 앞으로 구결 동안에 스케줄에 대해서 설명해 드리도록 하겠습니다.",
            startAt: 19320,
            endAt: 31320,
            spmValue: 287.98324461122263
        ),
        SentenceModel(
            index: 3,
            sentence: "4 명 혹은 새벽시간 테마 이고 총 여덟 팀이나 되게 서영 이며 이제 싸이클 받아 각 팀별로 정해 공부한 내용들을 공개 예정입니다.",
            startAt: 38040,
            endAt: 45149,
            spmValue: 430.4402869601913
        )
    ]
}

class SampleDigDaPracticesMock5 {
    static var shared = SampleDigDaPracticesMock5()
    
    private init() {
//        summary.maxSpm = 521.8471733278111
//        summary.minSpm = 270.8333333333333
//        practice.summary = self.summary
//        practice.utterances = self.utterance
//        practice.words = self.words
//        practice.sentences = self.sentences
    }
    
    let practice = PracticeModel(
        practiceName: "다섯번째 연습",
        index: 4,
        isVisited: true,
        creatAt: "2023-12-02 17:49:45 GMT+09:00",
        audioPath: URL(fileURLWithPath: URL.getPath(fileName: "20231202174941", type: .audio).path()),
        videoPath: URL(fileURLWithPath: URL.getPath(fileName: "20231202174941", type: .video).path()),
        utterances: [],
        words: [],
        sentences: [],
        summary: PracticeSummaryModel(),
        remarkable: false,
        projectCreatAt: "2023. 12. 2. 오후 5:29"
    )
    
    var summary = PracticeSummaryModel(
        syllableSum: 367,
        durationSum: 6422,
        wordCount: 150,
        fillerWordCount: 7,
        eachFillerWordCount: [
            FillerWordModel(fillerWord:"아니", count: 0),
            FillerWordModel(fillerWord:"인제", count: 0),
            FillerWordModel(fillerWord:"아니아니", count: 0),
            FillerWordModel(fillerWord:"뭐였더라", count: 0),
            FillerWordModel(fillerWord:"그래서", count: 0),
            FillerWordModel(fillerWord:"뭔가", count: 0),
            FillerWordModel(fillerWord:"아", count: 0),
            FillerWordModel(fillerWord:"봐봐", count: 0),
            FillerWordModel(fillerWord:"어", count: 1),
            FillerWordModel(fillerWord:"저기", count: 0),
            FillerWordModel(fillerWord:"그러니까", count: 0),
            FillerWordModel(fillerWord:"약간", count: 0),
            FillerWordModel(fillerWord:"뭐였지", count: 0),
            FillerWordModel(fillerWord:"이제", count: 6),
            FillerWordModel(fillerWord:"음", count: 0),
            FillerWordModel(fillerWord:"흠", count: 0),
            FillerWordModel(fillerWord:"막", count: 0),
            FillerWordModel(fillerWord:"뭐", count: 0),
            FillerWordModel(fillerWord:"사실은", count: 0),
            FillerWordModel(fillerWord:"그니깐", count: 0),
            FillerWordModel(fillerWord:"뭐지", count: 0),
            FillerWordModel(fillerWord:"근데", count: 0)
        ],
        fastSentenceIndex: [2],
        slowSentenceIndex: [],
        spmAverage: 342.8464664393479,
        practiceLength: 85.6,
        fwpm: 4.906542056074767
    )
    var utterance = [
        UtteranceModel(
            startAt: 32640,
            duration: 4829,
            message: "제가 일주일간 스터드 를 모집 했었는데요 여러분들의 여러 관심 덕분에 최종 3 0 명의 오게 되었습니다."
        ),
        UtteranceModel(
            startAt: 22020,
            duration: 9300,
            message: "디그다 의 방향성을 간단하게 말씀드리고 앞으로 구결 동안에 스케줄에 대해서 설명해 드리도록 하겠습니다."
        ),
        UtteranceModel(
            startAt: 81390,
            duration: 2400,
            message: "이제 일정을 공유 해 드리도록 하겠습니다."
        ),
        UtteranceModel(
            startAt: 70860,
            duration: 8640,
            message: "이제 다양한 배경 들을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 등록 해 볼 수 있습니다."
        ),
        UtteranceModel(
            startAt: 45960,
            duration: 5730,
            message: "이제 그 한 사이클 의 총 8 개 주가 나오게 되겠죠 사이클 에 대한 설명은 뒤에서 제대로 하겠습니다."
        ),
        UtteranceModel(
            startAt: 19320,
            duration: 2159,
            message: "오늘 오리엔테이션 에서는."
        ),
        UtteranceModel(
            startAt: 10350,
            duration: 7770,
            message: "안녕하세요 여러분 아카데미 진행하는 D I 디자인 프로젝트 스터디 디그다 의 참여 의 신청 해줘서 감사합니다."
        ),
        UtteranceModel(
            startAt: 64470,
            duration: 5700,
            message: "이제 그 다양한 전공 분야를 가진 사람들이 모인 스터디기때문에."
        ),
        UtteranceModel(
            startAt: 38040,
            duration: 7109,
            message: "4 명 혹은 새벽시간 테마 이고 총 여덟 팀이나 되게 서영 이며 이제 싸이클 받아 각 팀별로 정해 공부한 내용들을 공개 예정입니다."
        ),
        UtteranceModel(
            startAt: 53280,
            duration: 10590,
            message: "이제 스터디 원들의 정보 문자 조사 결과 각각 개발 관련 1 9 % 기획 관련 2 5 % 디자인 관련 5 6 % 를 적고 있습니다 어 그 그 이처럼."
        )
    ]
    var words = [
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 100,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 147,
            word: "해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 38,
            word: "여러분들의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 18,
            word: "에서는.  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 91,
            word: "정보  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 11,
            word: "참여  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 115,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 107,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 75,
            word: "총  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 96,
            word: "개발  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 108,
            word: "5  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 73,
            word: "사이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 45,
            word: "명의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 62,
            word: "받아  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 148,
            word: "드리도록  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 5,
            index: 88,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 89,
            word: "스터디  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 23,
            word: "말씀드리고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 20,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 29,
            word: "설명해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 86,
            word: "제대로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 66,
            word: "공부한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 99,
            word: "9  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 65,
            word: "정해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 79,
            word: "나오게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 117,
            word: "이처럼. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 12,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 53,
            word: "이고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 128,
            word: "다양한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 109,
            word: "6  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 63,
            word: "각  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 126,
            word: "스터디기때문에. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 8,
            word: "스터디  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 5,
            word: "I  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 87,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 149,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 4,
            word: "D  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 32,
            word: "제가  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 33,
            word: "일주일간  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 49,
            word: "명  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 124,
            word: "사람들이  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 55,
            word: "여덟  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 3,
            word: "진행하는  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 34,
            word: "스터드  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 19,
            word: "디그다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 43,
            word: "3  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 98,
            word: "1  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 31,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 8,
            index: 144,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 2,
            word: "아카데미  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 132,
            word: "사람들과  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 104,
            word: "5  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 46,
            word: "오게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 94,
            word: "결과  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 93,
            word: "조사  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 113,
            word: "있습니다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 14,
            word: "해줘서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 129,
            word: "배경  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 102,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 6,
            word: "디자인  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 80,
            word: "되겠죠  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 106,
            word: "디자인  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 58,
            word: "서영  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 6,
            index: 118,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 97,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 51,
            word: "새벽시간  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 81,
            word: "사이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 69,
            word: "예정입니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 30,
            word: "드리도록  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 146,
            word: "공유  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 90,
            word: "원들의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 54,
            word: "총  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 71,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 68,
            word: "공개  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 140,
            word: "해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 116,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 50,
            word: "혹은  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 52,
            word: "테마  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 40,
            word: "관심  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 74,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 76,
            word: "8  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 84,
            word: "설명은  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 41,
            word: "덕분에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 48,
            word: "4  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 131,
            word: "가진  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 135,
            word: "관점에서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 105,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 85,
            word: "뒤에서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 78,
            word: "주가  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 1,
            word: "여러분  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 17,
            word: "오리엔테이션  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 139,
            word: "등록  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 24,
            word: "앞으로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 15,
            word: "감사합니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 57,
            word: "되게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 13,
            word: "신청  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 10,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 125,
            word: "모인  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 7,
            index: 127,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 26,
            word: "동안에  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 4,
            index: 70,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 77,
            word: "개  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 122,
            word: "분야를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 137,
            word: "바라  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 39,
            word: "여러  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 95,
            word: "각각  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 67,
            word: "내용들을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 25,
            word: "구결  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 42,
            word: "최종  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 121,
            word: "전공  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 7,
            word: "프로젝트  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 123,
            word: "가진  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 111,
            word: "를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 82,
            word: "에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 16,
            word: "오늘  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 5,
            index: 114,
            word: "어  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 120,
            word: "다양한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 0,
            word: "안녕하세요  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 83,
            word: "대한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 61,
            word: "싸이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 110,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 133,
            word: "서로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 103,
            word: "2  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 145,
            word: "일정을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 37,
            word: "했었는데요  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 92,
            word: "문자  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 56,
            word: "팀이나  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 35,
            word: "를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 141,
            word: "볼  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 64,
            word: "팀별로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 9,
            word: "디그다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 47,
            word: "되었습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 44,
            word: "0  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 112,
            word: "적고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 119,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 101,
            word: "기획  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 134,
            word: "다른  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 28,
            word: "대해서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 136,
            word: "주제를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 59,
            word: "이며  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 143,
            word: "있습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 138,
            word: "보고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 27,
            word: "스케줄에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 142,
            word: "수  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 130,
            word: "들을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 36,
            word: "모집  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 22,
            word: "간단하게  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 3,
            index: 60,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 72,
            word: "한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 21,
            word: "방향성을  "
        ),
    ]
    
    var sentences = [
        SentenceModel(
            index: 6,
            sentence: "이제 그 다양한 전공 분야를 가진 사람들이 모인 스터디기때문에.",
            startAt: 64470,
            endAt: 70170,
            spmValue: 273.6842105263158
        ),
        SentenceModel(
            index: 4,
            sentence: "이제 그 한 사이클 의 총 8 개 주가 나오게 되겠죠 사이클 에 대한 설명은 뒤에서 제대로 하겠습니다.",
            startAt: 45960,
            endAt: 51690,
            spmValue: 408.37696335078533
        ),
        SentenceModel(
            index: 2,
            sentence: "제가 일주일간 스터드 를 모집 했었는데요 여러분들의 여러 관심 덕분에 최종 3 0 명의 오게 되었습니다.",
            startAt: 32640,
            endAt: 37469,
            spmValue: 521.8471733278111
        ),
        SentenceModel(
            index: 8,
            sentence: "이제 일정을 공유 해 드리도록 하겠습니다.",
            startAt: 81390,
            endAt: 83790,
            spmValue: 425.0
        ),
        SentenceModel(
            index: 0,
            sentence: "안녕하세요 여러분 아카데미 진행하는 D I 디자인 프로젝트 스터디 디그다 의 참여 의 신청 해줘서 감사합니다.",
            startAt: 10350,
            endAt: 18120,
            spmValue: 347.4903474903475
        ),
        SentenceModel(
            index: 7,
            sentence: "이제 다양한 배경 들을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 등록 해 볼 수 있습니다.",
            startAt: 70860,
            endAt: 79500,
            spmValue: 270.8333333333333
        ),
        SentenceModel(
            index: 5,
            sentence: "이제 스터디 원들의 정보 문자 조사 결과 각각 개발 관련 1 9 % 기획 관련 2 5 % 디자인 관련 5 6 % 를 적고 있습니다 어 그 그 이처럼.",
            startAt: 53280,
            endAt: 63870,
            spmValue: 300.2832861189802
        ),
        SentenceModel(
            index: 1,
            sentence: "오늘 오리엔테이션 에서는. 디그다 의 방향성을 간단하게 말씀드리고 앞으로 구결 동안에 스케줄에 대해서 설명해 드리도록 하겠습니다.",
            startAt: 19320,
            endAt: 31320,
            spmValue: 287.98324461122263
        ),
        SentenceModel(
            index: 3,
            sentence: "4 명 혹은 새벽시간 테마 이고 총 여덟 팀이나 되게 서영 이며 이제 싸이클 받아 각 팀별로 정해 공부한 내용들을 공개 예정입니다.",
            startAt: 38040,
            endAt: 45149,
            spmValue: 430.4402869601913
        )
    ]
}

class SampleDigDaPracticesMock6 {
    static var shared = SampleDigDaPracticesMock6()
    
    private init() {
//        summary.maxSpm = 521.8471733278111
//        summary.minSpm = 270.8333333333333
//        practice.summary = self.summary
//        practice.utterances = self.utterance
//        practice.words = self.words
//        practice.sentences = self.sentences
    }
    
    let practice = PracticeModel(
        practiceName: "여섯번째 연습",
        index: 5,
        isVisited: true,
        creatAt: "2023-12-02 17:49:46 GMT+09:00",
        audioPath: URL(fileURLWithPath: URL.getPath(fileName: "20231202174941", type: .audio).path()),
        videoPath: URL(fileURLWithPath: URL.getPath(fileName: "20231202174941", type: .video).path()),
        utterances: [],
        words: [],
        sentences: [],
        summary: PracticeSummaryModel(),
        remarkable: false,
        projectCreatAt: "2023. 12. 2. 오후 5:29"
    )
    
    var summary = PracticeSummaryModel(
        syllableSum: 367,
        durationSum: 6422,
        wordCount: 150,
        fillerWordCount: 7,
        eachFillerWordCount: [
            FillerWordModel(fillerWord:"아니", count: 0),
            FillerWordModel(fillerWord:"인제", count: 0),
            FillerWordModel(fillerWord:"아니아니", count: 0),
            FillerWordModel(fillerWord:"뭐였더라", count: 0),
            FillerWordModel(fillerWord:"그래서", count: 0),
            FillerWordModel(fillerWord:"뭔가", count: 0),
            FillerWordModel(fillerWord:"아", count: 0),
            FillerWordModel(fillerWord:"봐봐", count: 0),
            FillerWordModel(fillerWord:"어", count: 1),
            FillerWordModel(fillerWord:"저기", count: 0),
            FillerWordModel(fillerWord:"그러니까", count: 0),
            FillerWordModel(fillerWord:"약간", count: 0),
            FillerWordModel(fillerWord:"뭐였지", count: 0),
            FillerWordModel(fillerWord:"이제", count: 6),
            FillerWordModel(fillerWord:"음", count: 0),
            FillerWordModel(fillerWord:"흠", count: 0),
            FillerWordModel(fillerWord:"막", count: 0),
            FillerWordModel(fillerWord:"뭐", count: 0),
            FillerWordModel(fillerWord:"사실은", count: 0),
            FillerWordModel(fillerWord:"그니깐", count: 0),
            FillerWordModel(fillerWord:"뭐지", count: 0),
            FillerWordModel(fillerWord:"근데", count: 0)
        ],
        fastSentenceIndex: [2],
        slowSentenceIndex: [],
        spmAverage: 342.8464664393479,
        practiceLength: 85.6,
        fwpm: 4.906542056074767
    )
    var utterance = [
        UtteranceModel(
            startAt: 32640,
            duration: 4829,
            message: "제가 일주일간 스터드 를 모집 했었는데요 여러분들의 여러 관심 덕분에 최종 3 0 명의 오게 되었습니다."
        ),
        UtteranceModel(
            startAt: 22020,
            duration: 9300,
            message: "디그다 의 방향성을 간단하게 말씀드리고 앞으로 구결 동안에 스케줄에 대해서 설명해 드리도록 하겠습니다."
        ),
        UtteranceModel(
            startAt: 81390,
            duration: 2400,
            message: "이제 일정을 공유 해 드리도록 하겠습니다."
        ),
        UtteranceModel(
            startAt: 70860,
            duration: 8640,
            message: "이제 다양한 배경 들을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 등록 해 볼 수 있습니다."
        ),
        UtteranceModel(
            startAt: 45960,
            duration: 5730,
            message: "이제 그 한 사이클 의 총 8 개 주가 나오게 되겠죠 사이클 에 대한 설명은 뒤에서 제대로 하겠습니다."
        ),
        UtteranceModel(
            startAt: 19320,
            duration: 2159,
            message: "오늘 오리엔테이션 에서는."
        ),
        UtteranceModel(
            startAt: 10350,
            duration: 7770,
            message: "안녕하세요 여러분 아카데미 진행하는 D I 디자인 프로젝트 스터디 디그다 의 참여 의 신청 해줘서 감사합니다."
        ),
        UtteranceModel(
            startAt: 64470,
            duration: 5700,
            message: "이제 그 다양한 전공 분야를 가진 사람들이 모인 스터디기때문에."
        ),
        UtteranceModel(
            startAt: 38040,
            duration: 7109,
            message: "4 명 혹은 새벽시간 테마 이고 총 여덟 팀이나 되게 서영 이며 이제 싸이클 받아 각 팀별로 정해 공부한 내용들을 공개 예정입니다."
        ),
        UtteranceModel(
            startAt: 53280,
            duration: 10590,
            message: "이제 스터디 원들의 정보 문자 조사 결과 각각 개발 관련 1 9 % 기획 관련 2 5 % 디자인 관련 5 6 % 를 적고 있습니다 어 그 그 이처럼."
        )
    ]
    var words = [
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 100,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 147,
            word: "해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 38,
            word: "여러분들의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 18,
            word: "에서는.  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 91,
            word: "정보  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 11,
            word: "참여  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 115,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 107,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 75,
            word: "총  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 96,
            word: "개발  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 108,
            word: "5  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 73,
            word: "사이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 45,
            word: "명의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 62,
            word: "받아  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 148,
            word: "드리도록  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 5,
            index: 88,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 89,
            word: "스터디  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 23,
            word: "말씀드리고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 20,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 29,
            word: "설명해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 86,
            word: "제대로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 66,
            word: "공부한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 99,
            word: "9  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 65,
            word: "정해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 79,
            word: "나오게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 117,
            word: "이처럼. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 12,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 53,
            word: "이고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 128,
            word: "다양한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 109,
            word: "6  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 63,
            word: "각  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 126,
            word: "스터디기때문에. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 8,
            word: "스터디  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 5,
            word: "I  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 87,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 149,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 4,
            word: "D  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 32,
            word: "제가  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 33,
            word: "일주일간  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 49,
            word: "명  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 124,
            word: "사람들이  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 55,
            word: "여덟  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 3,
            word: "진행하는  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 34,
            word: "스터드  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 19,
            word: "디그다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 43,
            word: "3  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 98,
            word: "1  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 31,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 8,
            index: 144,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 2,
            word: "아카데미  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 132,
            word: "사람들과  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 104,
            word: "5  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 46,
            word: "오게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 94,
            word: "결과  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 93,
            word: "조사  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 113,
            word: "있습니다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 14,
            word: "해줘서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 129,
            word: "배경  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 102,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 6,
            word: "디자인  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 80,
            word: "되겠죠  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 106,
            word: "디자인  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 58,
            word: "서영  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 6,
            index: 118,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 97,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 51,
            word: "새벽시간  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 81,
            word: "사이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 69,
            word: "예정입니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 30,
            word: "드리도록  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 146,
            word: "공유  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 90,
            word: "원들의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 54,
            word: "총  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 71,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 68,
            word: "공개  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 140,
            word: "해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 116,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 50,
            word: "혹은  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 52,
            word: "테마  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 40,
            word: "관심  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 74,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 76,
            word: "8  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 84,
            word: "설명은  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 41,
            word: "덕분에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 48,
            word: "4  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 131,
            word: "가진  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 135,
            word: "관점에서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 105,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 85,
            word: "뒤에서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 78,
            word: "주가  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 1,
            word: "여러분  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 17,
            word: "오리엔테이션  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 139,
            word: "등록  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 24,
            word: "앞으로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 15,
            word: "감사합니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 57,
            word: "되게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 13,
            word: "신청  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 10,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 125,
            word: "모인  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 7,
            index: 127,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 26,
            word: "동안에  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 4,
            index: 70,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 77,
            word: "개  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 122,
            word: "분야를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 137,
            word: "바라  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 39,
            word: "여러  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 95,
            word: "각각  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 67,
            word: "내용들을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 25,
            word: "구결  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 42,
            word: "최종  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 121,
            word: "전공  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 7,
            word: "프로젝트  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 123,
            word: "가진  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 111,
            word: "를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 82,
            word: "에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 16,
            word: "오늘  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 5,
            index: 114,
            word: "어  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 120,
            word: "다양한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 0,
            word: "안녕하세요  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 83,
            word: "대한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 61,
            word: "싸이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 110,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 133,
            word: "서로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 103,
            word: "2  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 145,
            word: "일정을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 37,
            word: "했었는데요  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 92,
            word: "문자  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 56,
            word: "팀이나  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 35,
            word: "를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 141,
            word: "볼  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 64,
            word: "팀별로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 9,
            word: "디그다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 47,
            word: "되었습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 44,
            word: "0  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 112,
            word: "적고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 119,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 101,
            word: "기획  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 134,
            word: "다른  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 28,
            word: "대해서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 136,
            word: "주제를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 59,
            word: "이며  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 143,
            word: "있습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 138,
            word: "보고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 27,
            word: "스케줄에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 142,
            word: "수  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 130,
            word: "들을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 36,
            word: "모집  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 22,
            word: "간단하게  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 3,
            index: 60,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 72,
            word: "한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 21,
            word: "방향성을  "
        ),
    ]
    
    var sentences = [
        SentenceModel(
            index: 6,
            sentence: "이제 그 다양한 전공 분야를 가진 사람들이 모인 스터디기때문에.",
            startAt: 64470,
            endAt: 70170,
            spmValue: 273.6842105263158
        ),
        SentenceModel(
            index: 4,
            sentence: "이제 그 한 사이클 의 총 8 개 주가 나오게 되겠죠 사이클 에 대한 설명은 뒤에서 제대로 하겠습니다.",
            startAt: 45960,
            endAt: 51690,
            spmValue: 408.37696335078533
        ),
        SentenceModel(
            index: 2,
            sentence: "제가 일주일간 스터드 를 모집 했었는데요 여러분들의 여러 관심 덕분에 최종 3 0 명의 오게 되었습니다.",
            startAt: 32640,
            endAt: 37469,
            spmValue: 521.8471733278111
        ),
        SentenceModel(
            index: 8,
            sentence: "이제 일정을 공유 해 드리도록 하겠습니다.",
            startAt: 81390,
            endAt: 83790,
            spmValue: 425.0
        ),
        SentenceModel(
            index: 0,
            sentence: "안녕하세요 여러분 아카데미 진행하는 D I 디자인 프로젝트 스터디 디그다 의 참여 의 신청 해줘서 감사합니다.",
            startAt: 10350,
            endAt: 18120,
            spmValue: 347.4903474903475
        ),
        SentenceModel(
            index: 7,
            sentence: "이제 다양한 배경 들을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 등록 해 볼 수 있습니다.",
            startAt: 70860,
            endAt: 79500,
            spmValue: 270.8333333333333
        ),
        SentenceModel(
            index: 5,
            sentence: "이제 스터디 원들의 정보 문자 조사 결과 각각 개발 관련 1 9 % 기획 관련 2 5 % 디자인 관련 5 6 % 를 적고 있습니다 어 그 그 이처럼.",
            startAt: 53280,
            endAt: 63870,
            spmValue: 300.2832861189802
        ),
        SentenceModel(
            index: 1,
            sentence: "오늘 오리엔테이션 에서는. 디그다 의 방향성을 간단하게 말씀드리고 앞으로 구결 동안에 스케줄에 대해서 설명해 드리도록 하겠습니다.",
            startAt: 19320,
            endAt: 31320,
            spmValue: 287.98324461122263
        ),
        SentenceModel(
            index: 3,
            sentence: "4 명 혹은 새벽시간 테마 이고 총 여덟 팀이나 되게 서영 이며 이제 싸이클 받아 각 팀별로 정해 공부한 내용들을 공개 예정입니다.",
            startAt: 38040,
            endAt: 45149,
            spmValue: 430.4402869601913
        )
    ]
}

class SampleDigDaPracticesMock7 {
    static var shared = SampleDigDaPracticesMock7()
    
    private init() {
//        summary.maxSpm = 521.8471733278111
//        summary.minSpm = 270.8333333333333
//        practice.summary = self.summary
//        practice.utterances = self.utterance
//        practice.words = self.words
//        practice.sentences = self.sentences
    }
    
    let practice = PracticeModel(
        practiceName: "일곱번째 연습",
        index: 6,
        isVisited: true,
        creatAt: "2023-12-02 17:49:47 GMT+09:00",
        audioPath: URL(fileURLWithPath: URL.getPath(fileName: "20231202174941", type: .audio).path()),
        videoPath: URL(fileURLWithPath: URL.getPath(fileName: "20231202174941", type: .video).path()),
        utterances: [],
        words: [],
        sentences: [],
        summary: PracticeSummaryModel(),
        remarkable: false,
        projectCreatAt: "2023. 12. 2. 오후 5:29"
    )
    
    var summary = PracticeSummaryModel(
        syllableSum: 367,
        durationSum: 6422,
        wordCount: 150,
        fillerWordCount: 7,
        eachFillerWordCount: [
            FillerWordModel(fillerWord:"아니", count: 0),
            FillerWordModel(fillerWord:"인제", count: 0),
            FillerWordModel(fillerWord:"아니아니", count: 0),
            FillerWordModel(fillerWord:"뭐였더라", count: 0),
            FillerWordModel(fillerWord:"그래서", count: 0),
            FillerWordModel(fillerWord:"뭔가", count: 0),
            FillerWordModel(fillerWord:"아", count: 0),
            FillerWordModel(fillerWord:"봐봐", count: 0),
            FillerWordModel(fillerWord:"어", count: 1),
            FillerWordModel(fillerWord:"저기", count: 0),
            FillerWordModel(fillerWord:"그러니까", count: 0),
            FillerWordModel(fillerWord:"약간", count: 0),
            FillerWordModel(fillerWord:"뭐였지", count: 0),
            FillerWordModel(fillerWord:"이제", count: 6),
            FillerWordModel(fillerWord:"음", count: 0),
            FillerWordModel(fillerWord:"흠", count: 0),
            FillerWordModel(fillerWord:"막", count: 0),
            FillerWordModel(fillerWord:"뭐", count: 0),
            FillerWordModel(fillerWord:"사실은", count: 0),
            FillerWordModel(fillerWord:"그니깐", count: 0),
            FillerWordModel(fillerWord:"뭐지", count: 0),
            FillerWordModel(fillerWord:"근데", count: 0)
        ],
        fastSentenceIndex: [2],
        slowSentenceIndex: [],
        spmAverage: 342.8464664393479,
        practiceLength: 85.6,
        fwpm: 4.906542056074767
    )
    var utterance = [
        UtteranceModel(
            startAt: 32640,
            duration: 4829,
            message: "제가 일주일간 스터드 를 모집 했었는데요 여러분들의 여러 관심 덕분에 최종 3 0 명의 오게 되었습니다."
        ),
        UtteranceModel(
            startAt: 22020,
            duration: 9300,
            message: "디그다 의 방향성을 간단하게 말씀드리고 앞으로 구결 동안에 스케줄에 대해서 설명해 드리도록 하겠습니다."
        ),
        UtteranceModel(
            startAt: 81390,
            duration: 2400,
            message: "이제 일정을 공유 해 드리도록 하겠습니다."
        ),
        UtteranceModel(
            startAt: 70860,
            duration: 8640,
            message: "이제 다양한 배경 들을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 등록 해 볼 수 있습니다."
        ),
        UtteranceModel(
            startAt: 45960,
            duration: 5730,
            message: "이제 그 한 사이클 의 총 8 개 주가 나오게 되겠죠 사이클 에 대한 설명은 뒤에서 제대로 하겠습니다."
        ),
        UtteranceModel(
            startAt: 19320,
            duration: 2159,
            message: "오늘 오리엔테이션 에서는."
        ),
        UtteranceModel(
            startAt: 10350,
            duration: 7770,
            message: "안녕하세요 여러분 아카데미 진행하는 D I 디자인 프로젝트 스터디 디그다 의 참여 의 신청 해줘서 감사합니다."
        ),
        UtteranceModel(
            startAt: 64470,
            duration: 5700,
            message: "이제 그 다양한 전공 분야를 가진 사람들이 모인 스터디기때문에."
        ),
        UtteranceModel(
            startAt: 38040,
            duration: 7109,
            message: "4 명 혹은 새벽시간 테마 이고 총 여덟 팀이나 되게 서영 이며 이제 싸이클 받아 각 팀별로 정해 공부한 내용들을 공개 예정입니다."
        ),
        UtteranceModel(
            startAt: 53280,
            duration: 10590,
            message: "이제 스터디 원들의 정보 문자 조사 결과 각각 개발 관련 1 9 % 기획 관련 2 5 % 디자인 관련 5 6 % 를 적고 있습니다 어 그 그 이처럼."
        )
    ]
    var words = [
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 100,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 147,
            word: "해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 38,
            word: "여러분들의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 18,
            word: "에서는.  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 91,
            word: "정보  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 11,
            word: "참여  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 115,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 107,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 75,
            word: "총  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 96,
            word: "개발  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 108,
            word: "5  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 73,
            word: "사이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 45,
            word: "명의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 62,
            word: "받아  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 148,
            word: "드리도록  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 5,
            index: 88,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 89,
            word: "스터디  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 23,
            word: "말씀드리고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 20,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 29,
            word: "설명해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 86,
            word: "제대로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 66,
            word: "공부한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 99,
            word: "9  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 65,
            word: "정해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 79,
            word: "나오게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 117,
            word: "이처럼. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 12,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 53,
            word: "이고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 128,
            word: "다양한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 109,
            word: "6  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 63,
            word: "각  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 126,
            word: "스터디기때문에. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 8,
            word: "스터디  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 5,
            word: "I  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 87,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 149,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 4,
            word: "D  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 32,
            word: "제가  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 33,
            word: "일주일간  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 49,
            word: "명  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 124,
            word: "사람들이  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 55,
            word: "여덟  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 3,
            word: "진행하는  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 34,
            word: "스터드  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 19,
            word: "디그다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 43,
            word: "3  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 98,
            word: "1  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 31,
            word: "하겠습니다. "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 8,
            index: 144,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 2,
            word: "아카데미  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 132,
            word: "사람들과  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 104,
            word: "5  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 46,
            word: "오게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 94,
            word: "결과  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 93,
            word: "조사  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 113,
            word: "있습니다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 14,
            word: "해줘서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 129,
            word: "배경  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 102,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 6,
            word: "디자인  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 80,
            word: "되겠죠  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 106,
            word: "디자인  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 58,
            word: "서영  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 6,
            index: 118,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 97,
            word: "관련  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 51,
            word: "새벽시간  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 81,
            word: "사이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 69,
            word: "예정입니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 30,
            word: "드리도록  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 146,
            word: "공유  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 90,
            word: "원들의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 54,
            word: "총  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 71,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 68,
            word: "공개  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 140,
            word: "해  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 116,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 50,
            word: "혹은  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 52,
            word: "테마  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 40,
            word: "관심  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 74,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 76,
            word: "8  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 84,
            word: "설명은  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 41,
            word: "덕분에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 48,
            word: "4  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 131,
            word: "가진  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 135,
            word: "관점에서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 105,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 85,
            word: "뒤에서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 78,
            word: "주가  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 1,
            word: "여러분  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 17,
            word: "오리엔테이션  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 139,
            word: "등록  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 24,
            word: "앞으로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 15,
            word: "감사합니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 57,
            word: "되게  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 13,
            word: "신청  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 10,
            word: "의  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 125,
            word: "모인  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 7,
            index: 127,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 26,
            word: "동안에  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 4,
            index: 70,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 77,
            word: "개  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 122,
            word: "분야를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 137,
            word: "바라  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 39,
            word: "여러  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 95,
            word: "각각  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 67,
            word: "내용들을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 25,
            word: "구결  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 42,
            word: "최종  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 121,
            word: "전공  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 7,
            word: "프로젝트  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 123,
            word: "가진  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 111,
            word: "를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 82,
            word: "에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 16,
            word: "오늘  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 5,
            index: 114,
            word: "어  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 120,
            word: "다양한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 0,
            word: "안녕하세요  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 83,
            word: "대한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 61,
            word: "싸이클  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 110,
            word: "%  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 133,
            word: "서로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 103,
            word: "2  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 8,
            index: 145,
            word: "일정을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 37,
            word: "했었는데요  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 92,
            word: "문자  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 56,
            word: "팀이나  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 35,
            word: "를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 141,
            word: "볼  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 64,
            word: "팀별로  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 0,
            index: 9,
            word: "디그다  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 47,
            word: "되었습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 44,
            word: "0  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 112,
            word: "적고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 6,
            index: 119,
            word: "그  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 5,
            index: 101,
            word: "기획  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 134,
            word: "다른  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 28,
            word: "대해서  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 136,
            word: "주제를  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 3,
            index: 59,
            word: "이며  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 143,
            word: "있습니다. "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 138,
            word: "보고  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 27,
            word: "스케줄에  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 142,
            word: "수  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 7,
            index: 130,
            word: "들을  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 2,
            index: 36,
            word: "모집  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 22,
            word: "간단하게  "
        ),
        WordModel(
            isFillerWord: true,
            sentenceIndex: 3,
            index: 60,
            word: "이제  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 4,
            index: 72,
            word: "한  "
        ),
        WordModel(
            isFillerWord: false,
            sentenceIndex: 1,
            index: 21,
            word: "방향성을  "
        ),
    ]
    
    var sentences = [
        SentenceModel(
            index: 6,
            sentence: "이제 그 다양한 전공 분야를 가진 사람들이 모인 스터디기때문에.",
            startAt: 64470,
            endAt: 70170,
            spmValue: 273.6842105263158
        ),
        SentenceModel(
            index: 4,
            sentence: "이제 그 한 사이클 의 총 8 개 주가 나오게 되겠죠 사이클 에 대한 설명은 뒤에서 제대로 하겠습니다.",
            startAt: 45960,
            endAt: 51690,
            spmValue: 408.37696335078533
        ),
        SentenceModel(
            index: 2,
            sentence: "제가 일주일간 스터드 를 모집 했었는데요 여러분들의 여러 관심 덕분에 최종 3 0 명의 오게 되었습니다.",
            startAt: 32640,
            endAt: 37469,
            spmValue: 521.8471733278111
        ),
        SentenceModel(
            index: 8,
            sentence: "이제 일정을 공유 해 드리도록 하겠습니다.",
            startAt: 81390,
            endAt: 83790,
            spmValue: 425.0
        ),
        SentenceModel(
            index: 0,
            sentence: "안녕하세요 여러분 아카데미 진행하는 D I 디자인 프로젝트 스터디 디그다 의 참여 의 신청 해줘서 감사합니다.",
            startAt: 10350,
            endAt: 18120,
            spmValue: 347.4903474903475
        ),
        SentenceModel(
            index: 7,
            sentence: "이제 다양한 배경 들을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 등록 해 볼 수 있습니다.",
            startAt: 70860,
            endAt: 79500,
            spmValue: 270.8333333333333
        ),
        SentenceModel(
            index: 5,
            sentence: "이제 스터디 원들의 정보 문자 조사 결과 각각 개발 관련 1 9 % 기획 관련 2 5 % 디자인 관련 5 6 % 를 적고 있습니다 어 그 그 이처럼.",
            startAt: 53280,
            endAt: 63870,
            spmValue: 300.2832861189802
        ),
        SentenceModel(
            index: 1,
            sentence: "오늘 오리엔테이션 에서는. 디그다 의 방향성을 간단하게 말씀드리고 앞으로 구결 동안에 스케줄에 대해서 설명해 드리도록 하겠습니다.",
            startAt: 19320,
            endAt: 31320,
            spmValue: 287.98324461122263
        ),
        SentenceModel(
            index: 3,
            sentence: "4 명 혹은 새벽시간 테마 이고 총 여덟 팀이나 되게 서영 이며 이제 싸이클 받아 각 팀별로 정해 공부한 내용들을 공개 예정입니다.",
            startAt: 38040,
            endAt: 45149,
            spmValue: 430.4402869601913
        )
    ]
}

