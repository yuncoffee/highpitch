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

// swiftlint: disable type_body_length file_length
class SampleDigDaPracticesMock1 {
    static var shared = SampleDigDaPracticesMock1()
    
    private init() {}
    
//    expr var $practice1 = practices[0]
//    p print("let practice = PracticeModel(\npracticeName: \"\($practice1.practiceName)\",\nindex: \($practice1.index),\nisVisited: \($practice1.isVisited),\ncreatAt: \"\($practice1.creatAt)\",\naudioPath: \($practice1.audioPath),\nvideoPath: \($practice1.videoPath),\nutterances: [],\nwords: [],\n sentences: [],\n summary: PracticeSummaryModel(),\nremarkable: false,\nprojectCreatAt:\"\($practice1.projectCreatAt)\"\n)")
    
    let practice = PracticeModel(
    practiceName: "첫번째 연습",
    index: 0,
    isVisited: true,
    creatAt: "2023-12-03 23:26:35 GMT+09:00",
    audioPath: URL(fileURLWithPath: URL.getPath(fileName: "20231203232635", type: .audio).path()),
    videoPath: URL(fileURLWithPath: URL.getPath(fileName: "20231203232635", type: .video).path()),
    utterances: [],
    words: [],
     sentences: [],
     summary: PracticeSummaryModel(),
    remarkable: false,
    projectCreatAt:"2023. 12. 3. 오후 11:31"
    )
//    expr var $summary = practices[0].summary
//    expr var $eachFillerWordCount = practices[0].summary.eachFillerWordCount
//    p for item in $eachFillerWordCount {print("FillerWordModel(fillerWord:\"\(item.fillerWord)\", count: \(item.count)),")}
    var summary = PracticeSummaryModel(
        syllableSum: 1347,
        durationSum: 193328,
        wordCount: 532,
        fillerWordCount: 1,
        eachFillerWordCount: [
            FillerWordModel(fillerWord:"뭐였더라", count: 0),
            FillerWordModel(fillerWord:"봐봐", count: 0),
            FillerWordModel(fillerWord:"그니깐", count: 0),
            FillerWordModel(fillerWord:"뭐지", count: 0),
            FillerWordModel(fillerWord:"뭐", count: 0),
            FillerWordModel(fillerWord:"음", count: 0),
            FillerWordModel(fillerWord:"어", count: 0),
            FillerWordModel(fillerWord:"근데", count: 0),
            FillerWordModel(fillerWord:"막", count: 0),
            FillerWordModel(fillerWord:"이제", count: 1),
            FillerWordModel(fillerWord:"흠", count: 0),
            FillerWordModel(fillerWord:"뭔가", count: 0),
            FillerWordModel(fillerWord:"저기", count: 0),
            FillerWordModel(fillerWord:"뭐였지", count: 0),
            FillerWordModel(fillerWord:"아", count: 0),
            FillerWordModel(fillerWord:"인제", count: 0),
            FillerWordModel(fillerWord:"약간", count: 0),
            FillerWordModel(fillerWord:"아니", count: 0),
            FillerWordModel(fillerWord:"그래서", count: 0),
            FillerWordModel(fillerWord:"사실은", count: 0),
            FillerWordModel(fillerWord:"그러니까", count: 0),
        ],
        fastSentenceIndex: [36, 37],
        slowSentenceIndex: [8],
        spmAverage: 418.04601506248446,
        practiceLength: 255.48266666666666,
        fwpm: 0.23484959188359811
    )
    // maxSpm = 563.80721430736583
    // minSpm = 300.97087378640776
//    UtteranceModel(
//        startAt: 32640,
//        duration: 4829,
//        message: "제가 일주일간 스터드 를 모집 했었는데요 여러분들의 여러 관심 덕분에 최종 3 0 명의 오게 되었습니다."
//    ),
//    expr var $utterances = practices[0].utterances
//    p for item in $utterances {print("UtteranceModel(\nstartAt: \(item.startAt),\nduration: \(item.duration),\nmessage: \"\(item.message)\"\n),")}
    var utterances = [
        UtteranceModel(
        startAt: 220440,
        duration: 4919,
        message: "앞에서 말씀드렸듯이 스터디는 한 달에 한 사이클 씩 총 아홉 사이클 로 이루어져 있으며."
        ),
        UtteranceModel(
        startAt: 196829,
        duration: 3870,
        message: "구경관에 스터디 가 끝나면 그동안에 결과물 들을 아카이빙 하려고 합니다."
        ),
        UtteranceModel(
        startAt: 114060,
        duration: 6869,
        message: "둘째 주 부터 넷째 주 까지는 매주 랜덤으로 세팀 씩 팀끼리 공부한 내용을 공유 하는 시간이 될 예정입니다."
        ),
        UtteranceModel(
        startAt: 61470,
        duration: 8879,
        message: "이처럼 다양한 전국 문제를 가진 사람들이 모인 스터디 이기 때문에 다양한 배경을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 분석 해 볼 수 있습니다."
        ),
        UtteranceModel(
        startAt: 174690,
        duration: 1530,
        message: "주제에 제한은 따로 없으며."
        ),
        UtteranceModel(
        startAt: 154410,
        duration: 5789,
        message: "개인적으로 터전 들과 나누고 싶은 이야기들이 있으신 모든 분들께 지원 받으니 많은 관심 부탁드리겠습니다."
        ),
        UtteranceModel(
        startAt: 123119,
        duration: 4500,
        message: "첫째 쭈 팀별 등 이후 각 주차 별 별로 공유할 팀들이 면담 으로 배정 되니."
        ),
        UtteranceModel(
        startAt: 128190,
        duration: 4620,
        message: "각 팀들은 본인 주차에 맞춰 내용 공부 공유 하시면 감사하겠습니다."
        ),
        UtteranceModel(
        startAt: 80790,
        duration: 5459,
        message: "앞에서 사이클 마다 각 팀별로 주제를 정해 공부한 내용들을 공유 예정 이라고 말씀 드렸는데요."
        ),
        UtteranceModel(
        startAt: 13650,
        duration: 3630,
        message: "오늘 오리엔테이션 에서는 디그다 방향성을 간단하게 말씀 드리고."
        ),
        UtteranceModel(
        startAt: 215370,
        duration: 4259,
        message: "마지막으로 스터디 가입 및 탈퇴 에 대해 설명 드리고 마치도록 하겠습니다."
        ),
        UtteranceModel(
        startAt: 234810,
        duration: 3299,
        message: "새로운 싸이클이 시작 되기 최소 일주일 전에만 말씀하시면 감사하겠습니다."
        ),
        UtteranceModel(
        startAt: 245100,
        duration: 3870,
        message: "궁금한 적이 있다면 언제든지 저희 무너진 에게 편하게 질문 해 주세요."
        ),
        UtteranceModel(
        startAt: 133950,
        duration: 4289,
        message: "둘째주 에서 여대 주 까지는 팀 세션이 해도 개인 세션이 준비되어 있는데요."
        ),
        UtteranceModel(
        startAt: 182400,
        duration: 2729,
        message: "구체적인 주제 예시는 이런 식이 될 수 있을 것 같습니다."
        ),
        UtteranceModel(
        startAt: 74850,
        duration: 5039,
        message: "이미 여러분들이 알고 계신 대로 1 2 월 사 일과 5 일에 걸쳐서 는 오리엔테이션 이 진행 됩니다."
        ),
        UtteranceModel(
        startAt: 239520,
        duration: 5040,
        message: "여기까지 아카데미 에서 진행하는 저희 프로젝트 디자인 스터디 디그다 에 대한 전반적인 소개 없고."
        ),
        UtteranceModel(
        startAt: 139019,
        duration: 9569,
        message: "중간 중간 개인적으로 공유하고 싶은 내용들이 있으신 분들은 각 주차 별로 하면 시험마다 5 분 정도 간단하게 공유 하는 시간을 가져 볼까 합니다."
        ),
        UtteranceModel(
        startAt: 169710,
        duration: 4079,
        message: "매 사이클 첫째 주에 시행 되는 주제 선정 과 관련해서 말씀드리도록 하겠습니다."
        ),
        UtteranceModel(
        startAt: 50520,
        duration: 6180,
        message: "스터디 들의 전공 문제를 조사해본 결과 각각 개발 2 9 % 기획 관련 이 2 5 %."
        ),
        UtteranceModel(
        startAt: 225870,
        duration: 4979,
        message: "한 싸이클이 끝날 때마다 스터디 들은 자유롭게 합류 하고 떠나는 것이 가능합니다."
        ),
        UtteranceModel(
        startAt: 6660,
        duration: 900,
        message: "안녕하세요 여러분."
        ),
        UtteranceModel(
        startAt: 8070,
        duration: 4890,
        message: "아카데미 진행하는 저희 프로젝트 디자인 스터디 디그다의 참여해 주셔서 감사합니다."
        ),
        UtteranceModel(
        startAt: 31020,
        duration: 4770,
        message: "4 명 혹은 세 명씩 한 팀을 이루어 총 여덟 팀으로 다니게 될 예정이며."
        ),
        UtteranceModel(
        startAt: 41760,
        duration: 6330,
        message: "한 사이클 의 총 8 개 주제가 나오게 되겠죠 사이클 에 대한 자세한 설명은 뒤에서 다시 해 드리도록 하겠습니다."
        ),
        UtteranceModel(
        startAt: 189299,
        duration: 4950,
        message: "팀에서 탐구 하고 토론 하며 공부해 보고 싶은 주제를 찾아 보는 것을 추천 드립니다."
        ),
        UtteranceModel(
        startAt: 149760,
        duration: 4140,
        message: "본인의 전공과 관련된 내용 일 수도 있고 개인적으로 탐구 해 본 내역 일 수도 있는 등."
        ),
        UtteranceModel(
        startAt: 249630,
        duration: 1469,
        message: "지금까지 들어서 감사합니다."
        ),
        UtteranceModel(
        startAt: 36360,
        duration: 4289,
        message: "싸이클 마다 각 팀별로 주제를 정해 공부한 내용들을 공유 할 예정입니다."
        ),
        UtteranceModel(
        startAt: 86970,
        duration: 4440,
        message: "한 달을 한 사이클로 잡고 구 개월간 총 아홉 번에 싸이클이 제한 됩니다."
        ),
        UtteranceModel(
        startAt: 201750,
        duration: 2790,
        message: "1 6 대구 비 올 프로젝션 프레젠테이션 차로 들과."
        ),
        UtteranceModel(
        startAt: 108300,
        duration: 5159,
        message: "한 사이클 에서 첫 주는 팀빌딩 과 함께 각 팀별로 주제를 수정 하는 시간 이며."
        ),
        UtteranceModel(
        startAt: 208170,
        duration: 5159,
        message: "각 팀에서 는 프레젠테이션 옵션 템플릿 을 잘 시켜 공유 제를 만들어 주면 감사하겠습니다."
        ),
        UtteranceModel(
        startAt: 22620,
        duration: 2160,
        message: "지난 일주일간 스터디를 모집 했었는데요."
        ),
        UtteranceModel(
        startAt: 72090,
        duration: 1859,
        message: "이제 일정 공유 드리도록 하겠습니다."
        ),
        UtteranceModel(
        startAt: 162240,
        duration: 5250,
        message: "스터디는 하루 평균 두 시간씩 지낼 예정이며 각 팀들은 3 0 분 의 시간을 배정 받게 됩니다."
        ),
        UtteranceModel(
        startAt: 176760,
        duration: 3329,
        message: "팀에서 탐구 해 보고 싶은 주제 라면 무엇이든지 계셨습니다."
        ),
        UtteranceModel(
        startAt: 17790,
        duration: 3270,
        message: "앞으로 9 개월 동안 의 스케줄에 대해서 설명을 드리려고 합니다."
        ),
        UtteranceModel(
        startAt: 25470,
        duration: 3900,
        message: "여러분의 열렬한 관심 덕분에 최종 3 1 명이 모이게 되었습니다."
        ),
        UtteranceModel(
        startAt: 231720,
        duration: 2069,
        message: "본인의 일정에 맞게 부담없이 말씀해 주세요."
        ),
        UtteranceModel(
        startAt: 93330,
        duration: 10049,
        message: "저희 스터디는 앞으로 매주 월요일 저녁 6 시에 오리엔테이션 하고 있는 이곳 포항공대 파이브 건물 오층 메인 역에서 진행 되니 이지 말고 참석 부탁드립니다."
        ),
        UtteranceModel(
        startAt: 57210,
        duration: 2640,
        message: "디자인 관련 이 5 6 % 비율을 차지하고 있었습니다."
        ),
        UtteranceModel(
        startAt: 205049,
        duration: 2400,
        message: "N 션 으로는 텍스트를 와블 예정입니다."
        ),
        UtteranceModel(
        startAt: 187200,
        duration: 1379,
        message: "하지만 여기에 국한 되지 말고."
        ),
        UtteranceModel(
        startAt: 105240,
        duration: 2340,
        message: "구체적인 사이클 일정에 대해 말씀드리겠습니다."
        )
    ]
//    expr var $words = practices[0].words
//    p for item in $words {print("WordModel(\nisFillerWord: \(item.isFillerWord),\nsentenceIndex: \(item.sentenceIndex),\nindex: \(item.index),\nword: \"\(item.word)\"\n),")}
    var words = [
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 193,
        word: "매주 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 340,
        word: "관심 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 66,
        word: "내용들을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 413,
        word: "구경관에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 281,
        word: "까지는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 202,
        word: "포항공대 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 178,
        word: "달을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 171,
        word: "내용들을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 49,
        word: "명씩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 351,
        word: "3 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 36,
        word: "열렬한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 197,
        word: "시에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 490,
        word: "일정에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 191,
        word: "스터디는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 478,
        word: "싸이클이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 320,
        word: "탐구 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 312,
        word: "본인의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 46,
        word: "명 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 402,
        word: "토론 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 173,
        word: "예정 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 407,
        word: "주제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 375,
        word: "팀에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 391,
        word: "있을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 422,
        word: "합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 138,
        word: "수 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 496,
        word: "싸이클이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 97,
        word: "2 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 292,
        word: "공유하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 335,
        word: "모든 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 254,
        word: "팀별 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 329,
        word: "터전 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 69,
        word: "예정입니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 114,
        word: "있었습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 73,
        word: "총 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 183,
        word: "개월간 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 132,
        word: "주제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 527,
        word: "해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 44,
        word: "되었습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 209,
        word: "되니 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 121,
        word: "모인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 165,
        word: "마다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 118,
        word: "문제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 91,
        word: "전공 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 39,
        word: "최종 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 169,
        word: "정해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 334,
        word: "있으신 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 61,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 409,
        word: "보는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 317,
        word: "수도 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 458,
        word: "대해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 106,
        word: "디자인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 54,
        word: "여덟 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 78,
        word: "되겠죠 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 133,
        word: "바라 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 128,
        word: "사람들과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 198,
        word: "오리엔테이션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 116,
        word: "다양한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 400,
        word: "탐구 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 43,
        word: "모이게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 136,
        word: "해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 152,
        word: "월 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 492,
        word: "부담없이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 308,
        word: "시간을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 58,
        word: "예정이며."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 250,
        word: "될 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 336,
        word: "분들께 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 120,
        word: "사람들이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 153,
        word: "사 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 468,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 21,
        word: "9 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 385,
        word: "주제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 12,
        word: "오늘 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 150,
        word: "1 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 343,
        word: "하루 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 440,
        word: "는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 232,
        word: "시간 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 430,
        word: "차로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 501,
        word: "전에만 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 395,
        word: "여기에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 404,
        word: "공부해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 416,
        word: "끝나면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 383,
        word: "계셨습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 124,
        word: "때문에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 410,
        word: "것을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 504,
        word: "여기까지 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 475,
        word: "이루어져 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 278,
        word: "에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 210,
        word: "이지 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 253,
        word: "쭈 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 466,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 509,
        word: "프로젝트 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 143,
        word: "드리도록 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 109,
        word: "5 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 359,
        word: "매 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 424,
        word: "6 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 122,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 382,
        word: "무엇이든지 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 306,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 303,
        word: "분 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 117,
        word: "전국 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 15,
        word: "디그다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 42,
        word: "명이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 168,
        word: "주제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 216,
        word: "일정에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 179,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 300,
        word: "하면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 55,
        word: "팀으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 123,
        word: "이기 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 82,
        word: "자세한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 74,
        word: "8 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 437,
        word: "예정입니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 445,
        word: "잘 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 163,
        word: "앞에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 107,
        word: "관련 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 102,
        word: "이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 411,
        word: "추천 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 365,
        word: "주제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 296,
        word: "분들은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 358,
        word: "됩니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 167,
        word: "팀별로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 229,
        word: "주제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 412,
        word: "드립니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 237,
        word: "넷째 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 467,
        word: "달에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 111,
        word: "% "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 420,
        word: "아카이빙 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 298,
        word: "주차 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 75,
        word: "개 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 339,
        word: "많은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 155,
        word: "5 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 408,
        word: "찾아 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 154,
        word: "일과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 4,
        word: "저희 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 45,
        word: "4 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 213,
        word: "부탁드립니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 182,
        word: "구 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 459,
        word: "설명 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 110,
        word: "6 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 508,
        word: "저희 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 461,
        word: "마치도록 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 511,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 261,
        word: "공유할 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 429,
        word: "프레젠테이션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 344,
        word: "평균 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 85,
        word: "다시 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 53,
        word: "총 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 338,
        word: "받으니 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 331,
        word: "나누고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 224,
        word: "팀빌딩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 528,
        word: "주세요."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 294,
        word: "내용들이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 326,
        word: "있는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 244,
        word: "팀끼리 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 353,
        word: "분 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 41,
        word: "1 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 494,
        word: "주세요."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 510,
        word: "디자인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 223,
        word: "주는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 450,
        word: "주면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 366,
        word: "선정 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 192,
        word: "앞으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 464,
        word: "말씀드렸듯이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 376,
        word: "탐구 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 479,
        word: "끝날 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 201,
        word: "이곳 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 497,
        word: "시작 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 220,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 352,
        word: "0 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 34,
        word: "했었는데요."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 515,
        word: "전반적인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 89,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 301,
        word: "시험마다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 521,
        word: "언제든지 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 62,
        word: "팀별로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 219,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 71,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 514,
        word: "대한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 499,
        word: "최소 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 88,
        word: "하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 309,
        word: "가져 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 19,
        word: "드리고."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 271,
        word: "맞춰 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 170,
        word: "공부한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 269,
        word: "본인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 16,
        word: "방향성을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 8,
        word: "디그다의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 14,
        word: "에서는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 381,
        word: "라면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 112,
        word: "비율을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 465,
        word: "스터디는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 275,
        word: "하시면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 23,
        word: "동안 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 434,
        word: "으로는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 30,
        word: "지난 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 225,
        word: "과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 164,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 115,
        word: "이처럼 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 519,
        word: "적이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 86,
        word: "해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 56,
        word: "다니게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 518,
        word: "궁금한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 516,
        word: "소개 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 137,
        word: "볼 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 438,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 488,
        word: "가능합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 195,
        word: "저녁 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 282,
        word: "팀 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 513,
        word: "에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 315,
        word: "내용 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 35,
        word: "여러분의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 285,
        word: "개인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 360,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 240,
        word: "매주 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 230,
        word: "수정 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 367,
        word: "과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 142,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 295,
        word: "있으신 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 442,
        word: "옵션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 187,
        word: "싸이클이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 290,
        word: "중간 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 172,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 40,
        word: "3 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 11,
        word: "감사합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 421,
        word: "하려고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 332,
        word: "싶은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 472,
        word: "아홉 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 188,
        word: "제한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 268,
        word: "팀들은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 396,
        word: "국한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 500,
        word: "일주일 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 393,
        word: "같습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 148,
        word: "계신 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 446,
        word: "시켜 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 29,
        word: "합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 276,
        word: "감사하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 432,
        word: "N "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 433,
        word: "션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 345,
        word: "두 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 222,
        word: "첫 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 215,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 444,
        word: "을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 485,
        word: "하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 130,
        word: "다른 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 349,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 321,
        word: "해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 79,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 214,
        word: "구체적인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 512,
        word: "디그다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 487,
        word: "것이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 25,
        word: "스케줄에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 363,
        word: "시행 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 126,
        word: "배경을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 141,
        word: "일정 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 212,
        word: "참석 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 398,
        word: "말고. "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 80,
        word: "에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 481,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 428,
        word: "프로젝션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 1,
        word: "여러분. "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 63,
        word: "주제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 104,
        word: "5 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 0,
        word: "안녕하세요 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 379,
        word: "싶은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 270,
        word: "주차에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 454,
        word: "가입 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 314,
        word: "관련된 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 357,
        word: "받게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 28,
        word: "드리려고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 242,
        word: "세팀 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 146,
        word: "여러분들이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 399,
        word: "팀에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 199,
        word: "하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 525,
        word: "편하게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 235,
        word: "주 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 92,
        word: "문제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 284,
        word: "해도 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 480,
        word: "때마다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 452,
        word: "마지막으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 333,
        word: "이야기들이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 76,
        word: "주제가 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 241,
        word: "랜덤으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 388,
        word: "식이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 207,
        word: "역에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 51,
        word: "팀을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 346,
        word: "시간씩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 84,
        word: "뒤에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 427,
        word: "올 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 108,
        word: "이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 377,
        word: "해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 151,
        word: "2 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 208,
        word: "진행 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 248,
        word: "하는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 423,
        word: "1 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 451,
        word: "감사하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 2,
        word: "아카데미 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 431,
        word: "들과."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 324,
        word: "일 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 228,
        word: "팀별로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 425,
        word: "대구 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 341,
        word: "부탁드리겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 26,
        word: "대해서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 181,
        word: "잡고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 280,
        word: "주 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 462,
        word: "하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 5,
        word: "프로젝트 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 523,
        word: "무너진 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 350,
        word: "팀들은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 374,
        word: "없으며. "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 493,
        word: "말씀해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 99,
        word: "% "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 159,
        word: "오리엔테이션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 311,
        word: "합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 397,
        word: "되지 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 443,
        word: "템플릿 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 144,
        word: "하겠습니다. "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 83,
        word: "설명은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 370,
        word: "하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 267,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 476,
        word: "있으며."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 196,
        word: "6 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 355,
        word: "시간을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 190,
        word: "저희 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 524,
        word: "에게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 105,
        word: "%."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 67,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 90,
        word: "들의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 129,
        word: "서로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 371,
        word: "주제에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 27,
        word: "설명을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 162,
        word: "됩니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 59,
        word: "싸이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 415,
        word: "가 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 378,
        word: "보고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 463,
        word: "앞에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 227,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 147,
        word: "알고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 517,
        word: "없고."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 447,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 405,
        word: "보고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 217,
        word: "대해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 161,
        word: "진행 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 211,
        word: "말고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 96,
        word: "개발 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 403,
        word: "하며 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 70,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 251,
        word: "예정입니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 372,
        word: "제한은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 387,
        word: "이런 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 453,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 348,
        word: "예정이며 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 206,
        word: "메인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 6,
        word: "디자인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 149,
        word: "대로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 265,
        word: "배정 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 390,
        word: "수 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 100,
        word: "기획 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 200,
        word: "있는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 439,
        word: "팀에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 87,
        word: "드리도록 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 194,
        word: "월요일 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 263,
        word: "면담 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 319,
        word: "개인적으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 32,
        word: "스터디를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 234,
        word: "둘째 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 495,
        word: "새로운 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 238,
        word: "주 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 68,
        word: "할 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 364,
        word: "되는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 392,
        word: "것 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 266,
        word: "되니."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 64,
        word: "정해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 368,
        word: "관련해서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 361,
        word: "첫째 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 318,
        word: "있고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 498,
        word: "되기 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 175,
        word: "말씀 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 10,
        word: "주셔서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 264,
        word: "으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 313,
        word: "전공과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 252,
        word: "첫째 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 277,
        word: "둘째주 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 316,
        word: "일 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 389,
        word: "될 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 384,
        word: "구체적인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 185,
        word: "아홉 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 31,
        word: "일주일간 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 186,
        word: "번에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 57,
        word: "될 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 22,
        word: "개월 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 470,
        word: "씩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 307,
        word: "하는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 119,
        word: "가진 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 287,
        word: "준비되어 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 460,
        word: "드리고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 72,
        word: "의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 203,
        word: "파이브 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 473,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 47,
        word: "혹은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 156,
        word: "일에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 65,
        word: "공부한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 95,
        word: "각각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 139,
        word: "있습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 414,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 18,
        word: "말씀 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 33,
        word: "모집 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 158,
        word: "는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 299,
        word: "별로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 380,
        word: "주제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 526,
        word: "질문 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 406,
        word: "싶은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 419,
        word: "들을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 180,
        word: "사이클로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 401,
        word: "하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 394,
        word: "하지만 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 205,
        word: "오층 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 505,
        word: "아카데미 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 291,
        word: "개인적으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 354,
        word: "의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 103,
        word: "2 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 257,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 77,
        word: "나오게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 20,
        word: "앞으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 48,
        word: "세 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 231,
        word: "하는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 529,
        word: "지금까지 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 347,
        word: "지낼 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 81,
        word: "대한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 246,
        word: "내용을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 38,
        word: "덕분에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 471,
        word: "총 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 310,
        word: "볼까 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 174,
        word: "이라고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 258,
        word: "주차 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 435,
        word: "텍스트를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 255,
        word: "등 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 491,
        word: "맞게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 503,
        word: "감사하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 177,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 489,
        word: "본인의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 520,
        word: "있다면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 7,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 127,
        word: "가진 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 256,
        word: "이후 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 418,
        word: "결과물 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 221,
        word: "에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 302,
        word: "5 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 166,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 436,
        word: "와블 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 449,
        word: "만들어 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 293,
        word: "싶은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 289,
        word: "중간 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 507,
        word: "진행하는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 189,
        word: "됩니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 456,
        word: "탈퇴 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 448,
        word: "제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 327,
        word: "등."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 3,
        word: "진행하는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 502,
        word: "말씀하시면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 441,
        word: "프레젠테이션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 455,
        word: "및 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 323,
        word: "내역 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 259,
        word: "별 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 474,
        word: "로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 50,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 134,
        word: "보고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 469,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 482,
        word: "들은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 279,
        word: "여대 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 386,
        word: "예시는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 369,
        word: "말씀드리도록 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 305,
        word: "간단하게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 328,
        word: "개인적으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 486,
        word: "떠나는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 204,
        word: "건물 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 356,
        word: "배정 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 283,
        word: "세션이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 113,
        word: "차지하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 342,
        word: "스터디는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 24,
        word: "의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 94,
        word: "결과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 243,
        word: "씩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 145,
        word: "이미 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 330,
        word: "들과 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 11,
        index: 140,
        word: "이제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 131,
        word: "관점에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 325,
        word: "수도 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 60,
        word: "마다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 218,
        word: "말씀드리겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 245,
        word: "공부한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 274,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 13,
        word: "오리엔테이션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 135,
        word: "분석 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 426,
        word: "비 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 286,
        word: "세션이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 101,
        word: "관련 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 531,
        word: "감사합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 522,
        word: "저희 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 125,
        word: "다양한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 233,
        word: "이며."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 226,
        word: "함께 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 157,
        word: "걸쳐서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 477,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 322,
        word: "본 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 184,
        word: "총 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 98,
        word: "9 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 260,
        word: "별로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 236,
        word: "부터 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 530,
        word: "들어서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 160,
        word: "이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 239,
        word: "까지는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 337,
        word: "지원 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 37,
        word: "관심 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 176,
        word: "드렸는데요."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 457,
        word: "에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 483,
        word: "자유롭게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 17,
        word: "간단하게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 297,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 262,
        word: "팀들이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 288,
        word: "있는데요."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 273,
        word: "공부 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 373,
        word: "따로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 304,
        word: "정도 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 484,
        word: "합류 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 362,
        word: "주에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 272,
        word: "내용 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 506,
        word: "에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 93,
        word: "조사해본 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 249,
        word: "시간이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 9,
        word: "참여해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 52,
        word: "이루어 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 417,
        word: "그동안에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 247,
        word: "공유 "
        )
    ]
//    SentenceModel(
//        index: 6,
//        sentence: "이제 그 다양한 전공 분야를 가진 사람들이 모인 스터디기때문에.",
//        startAt: 64470,
//        endAt: 70170,
//        spmValue: 273.6842105263158
//    ),
//    expr var $sentences = practices[0].sentences
//    p for item in $sentences {print("\("SentenceModel(")\n\("index: ")\(item.index),\n\("sentence: ")\"\(item.sentence)\",\n\("startAt: ")\(item.startAt),\n\("endAt: ")\(item.endAt),\n\("spmValue: ")\(item.spmValue)\n\("),")")}
    var sentences = [
        SentenceModel(
        index: 7,
        sentence: "한 사이클 의 총 8 개 주제가 나오게 되겠죠 사이클 에 대한 자세한 설명은 뒤에서 다시 해 드리도록 하겠습니다.",
        startAt: 41760,
        endAt: 48090,
        spmValue: 417.06161137440756
        ),
        SentenceModel(
        index: 1,
        sentence: "오늘 오리엔테이션 에서는 디그다 방향성을 간단하게 말씀 드리고.",
        startAt: 13650,
        endAt: 17280,
        spmValue: 446.2809917355372
        ),
        SentenceModel(
        index: 28,
        sentence: "하지만 여기에 국한 되지 말고. 팀에서 탐구 하고 토론 하며 공부해 보고 싶은 주제를 찾아 보는 것을 추천 드립니다.",
        startAt: 187200,
        endAt: 194249,
        spmValue: 426.6076789382209
        ),
        SentenceModel(
        index: 39,
        sentence: "궁금한 적이 있다면 언제든지 저희 무너진 에게 편하게 질문 해 주세요.",
        startAt: 245100,
        endAt: 248970,
        spmValue: 434.1085271317829
        ),
        SentenceModel(
        index: 23,
        sentence: "개인적으로 터전 들과 나누고 싶은 이야기들이 있으신 모든 분들께 지원 받으니 많은 관심 부탁드리겠습니다.",
        startAt: 154410,
        endAt: 160199,
        spmValue: 456.03731214372084
        ),
        SentenceModel(
        index: 11,
        sentence: "이제 일정 공유 드리도록 하겠습니다. 이미 여러분들이 알고 계신 대로 1 2 월 사 일과 5 일에 걸쳐서 는 오리엔테이션 이 진행 됩니다.",
        startAt: 72090,
        endAt: 79889,
        spmValue: 461.0031893302407
        ),
        SentenceModel(
        index: 17,
        sentence: "둘째 주 부터 넷째 주 까지는 매주 랜덤으로 세팀 씩 팀끼리 공부한 내용을 공유 하는 시간이 될 예정입니다.",
        startAt: 114060,
        endAt: 120929,
        spmValue: 366.8656281845975
        ),
        SentenceModel(
        index: 10,
        sentence: "이처럼 다양한 전국 문제를 가진 사람들이 모인 스터디 이기 때문에 다양한 배경을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 분석 해 볼 수 있습니다.",
        startAt: 61470,
        endAt: 70349,
        spmValue: 425.723617524496
        ),
        SentenceModel(
        index: 31,
        sentence: "N 션 으로는 텍스트를 와블 예정입니다.",
        startAt: 205049,
        endAt: 207449,
        spmValue: 400.0
        ),
        SentenceModel(
        index: 35,
        sentence: "한 싸이클이 끝날 때마다 스터디 들은 자유롭게 합류 하고 떠나는 것이 가능합니다.",
        startAt: 225870,
        endAt: 230849,
        spmValue: 397.6702149025909
        ),
        SentenceModel(
        index: 26,
        sentence: "주제에 제한은 따로 없으며. 팀에서 탐구 해 보고 싶은 주제 라면 무엇이든지 계셨습니다.",
        startAt: 174690,
        endAt: 180089,
        spmValue: 432.18769294093437
        ),
        SentenceModel(
        index: 27,
        sentence: "구체적인 주제 예시는 이런 식이 될 수 있을 것 같습니다.",
        startAt: 182400,
        endAt: 185129,
        spmValue: 483.69366068156836
        ),
        SentenceModel(
        index: 29,
        sentence: "구경관에 스터디 가 끝나면 그동안에 결과물 들을 아카이빙 하려고 합니다.",
        startAt: 196829,
        endAt: 200699,
        spmValue: 465.1162790697674
        ),
        SentenceModel(
        index: 32,
        sentence: "각 팀에서 는 프레젠테이션 옵션 템플릿 을 잘 시켜 공유 제를 만들어 주면 감사하겠습니다.",
        startAt: 208170,
        endAt: 213329,
        spmValue: 418.6857918201202
        ),
        SentenceModel(
        index: 2,
        sentence: "앞으로 9 개월 동안 의 스케줄에 대해서 설명을 드리려고 합니다.",
        startAt: 17790,
        endAt: 21060,
        spmValue: 477.0642201834862
        ),
        SentenceModel(
        index: 20,
        sentence: "둘째주 에서 여대 주 까지는 팀 세션이 해도 개인 세션이 준비되어 있는데요.",
        startAt: 133950,
        endAt: 138239,
        spmValue: 419.67824667754724
        ),
        SentenceModel(
        index: 19,
        sentence: "각 팀들은 본인 주차에 맞춰 내용 공부 공유 하시면 감사하겠습니다.",
        startAt: 128190,
        endAt: 132810,
        spmValue: 350.64935064935065
        ),
        SentenceModel(
        index: 36,
        sentence: "본인의 일정에 맞게 부담없이 말씀해 주세요.",
        startAt: 231720,
        endAt: 233789,
        spmValue: 521.9913001449976
        ),
        SentenceModel(
        index: 33,
        sentence: "마지막으로 스터디 가입 및 탈퇴 에 대해 설명 드리고 마치도록 하겠습니다.",
        startAt: 215370,
        endAt: 219629,
        spmValue: 422.6344212256398
        ),
        SentenceModel(
        index: 24,
        sentence: "스터디는 하루 평균 두 시간씩 지낼 예정이며 각 팀들은 3 0 분 의 시간을 배정 받게 됩니다.",
        startAt: 162240,
        endAt: 167490,
        spmValue: 411.42857142857144
        ),
        SentenceModel(
        index: 22,
        sentence: "본인의 전공과 관련된 내용 일 수도 있고 개인적으로 탐구 해 본 내역 일 수도 있는 등.",
        startAt: 149760,
        endAt: 153900,
        spmValue: 478.2608695652174
        ),
        SentenceModel(
        index: 5,
        sentence: "4 명 혹은 세 명씩 한 팀을 이루어 총 여덟 팀으로 다니게 될 예정이며.",
        startAt: 31020,
        endAt: 35790,
        spmValue: 339.62264150943395
        ),
        SentenceModel(
        index: 40,
        sentence: "지금까지 들어서 감사합니다.",
        startAt: 249630,
        endAt: 251099,
        spmValue: 490.1293396868618
        ),
        SentenceModel(
        index: 0,
        sentence: "안녕하세요 여러분. 아카데미 진행하는 저희 프로젝트 디자인 스터디 디그다의 참여해 주셔서 감사합니다.",
        startAt: 6660,
        endAt: 12960,
        spmValue: 445.5958549222798
        ),
        SentenceModel(
        index: 15,
        sentence: "구체적인 사이클 일정에 대해 말씀드리겠습니다.",
        startAt: 105240,
        endAt: 107580,
        spmValue: 512.8205128205128
        ),
        SentenceModel(
        index: 12,
        sentence: "앞에서 사이클 마다 각 팀별로 주제를 정해 공부한 내용들을 공유 예정 이라고 말씀 드렸는데요.",
        startAt: 80790,
        endAt: 86249,
        spmValue: 417.6589118886243
        ),
        SentenceModel(
        index: 13,
        sentence: "한 달을 한 사이클로 잡고 구 개월간 총 아홉 번에 싸이클이 제한 됩니다.",
        startAt: 86970,
        endAt: 91410,
        spmValue: 378.3783783783784
        ),
        SentenceModel(
        index: 6,
        sentence: "싸이클 마다 각 팀별로 주제를 정해 공부한 내용들을 공유 할 예정입니다.",
        startAt: 36360,
        endAt: 40649,
        spmValue: 405.68897178829565
        ),
        SentenceModel(
        index: 37,
        sentence: "새로운 싸이클이 시작 되기 최소 일주일 전에만 말씀하시면 감사하겠습니다.",
        startAt: 234810,
        endAt: 238109,
        spmValue: 563.8072143073658
        ),
        SentenceModel(
        index: 38,
        sentence: "여기까지 아카데미 에서 진행하는 저희 프로젝트 디자인 스터디 디그다 에 대한 전반적인 소개 없고.",
        startAt: 239520,
        endAt: 244560,
        spmValue: 476.1904761904762
        ),
        SentenceModel(
        index: 3,
        sentence: "지난 일주일간 스터디를 모집 했었는데요.",
        startAt: 22620,
        endAt: 24780,
        spmValue: 472.22222222222223
        ),
        SentenceModel(
        index: 9,
        sentence: "디자인 관련 이 5 6 % 비율을 차지하고 있었습니다.",
        startAt: 57210,
        endAt: 59850,
        spmValue: 477.27272727272725
        ),
        SentenceModel(
        index: 21,
        sentence: "중간 중간 개인적으로 공유하고 싶은 내용들이 있으신 분들은 각 주차 별로 하면 시험마다 5 분 정도 간단하게 공유 하는 시간을 가져 볼까 합니다.",
        startAt: 139019,
        endAt: 148588,
        spmValue: 363.6743651374229
        ),
        SentenceModel(
        index: 34,
        sentence: "앞에서 말씀드렸듯이 스터디는 한 달에 한 사이클 씩 총 아홉 사이클 로 이루어져 있으며.",
        startAt: 220440,
        endAt: 225359,
        spmValue: 426.91603984549704
        ),
        SentenceModel(
        index: 30,
        sentence: "1 6 대구 비 올 프로젝션 프레젠테이션 차로 들과.",
        startAt: 201750,
        endAt: 204540,
        spmValue: 430.10752688172045
        ),
        SentenceModel(
        index: 8,
        sentence: "스터디 들의 전공 문제를 조사해본 결과 각각 개발 2 9 % 기획 관련 이 2 5 %.",
        startAt: 50520,
        endAt: 56700,
        spmValue: 300.97087378640776
        ),
        SentenceModel(
        index: 14,
        sentence: "저희 스터디는 앞으로 매주 월요일 저녁 6 시에 오리엔테이션 하고 있는 이곳 포항공대 파이브 건물 오층 메인 역에서 진행 되니 이지 말고 참석 부탁드립니다.",
        startAt: 93330,
        endAt: 103379,
        spmValue: 376.1568315255249
        ),
        SentenceModel(
        index: 25,
        sentence: "매 사이클 첫째 주에 시행 되는 주제 선정 과 관련해서 말씀드리도록 하겠습니다.",
        startAt: 169710,
        endAt: 173789,
        spmValue: 470.70360382446677
        ),
        SentenceModel(
        index: 16,
        sentence: "한 사이클 에서 첫 주는 팀빌딩 과 함께 각 팀별로 주제를 수정 하는 시간 이며.",
        startAt: 108300,
        endAt: 113459,
        spmValue: 348.90482651676683
        ),
        SentenceModel(
        index: 18,
        sentence: "첫째 쭈 팀별 등 이후 각 주차 별 별로 공유할 팀들이 면담 으로 배정 되니.",
        startAt: 123119,
        endAt: 127619,
        spmValue: 373.3333333333333
        ),
        SentenceModel(
        index: 4,
        sentence: "여러분의 열렬한 관심 덕분에 최종 3 1 명이 모이게 되었습니다.",
        startAt: 25470,
        endAt: 29370,
        spmValue: 400.0
        )
    ]
}

class SampleDigDaPracticesMock2 {
    static var shared = SampleDigDaPracticesMock2()
    
    private init() {}
    
    let practice = PracticeModel(
    practiceName: "두번째 연습",
    index: 1,
    isVisited: true,
    creatAt: "2023-12-03 23:35:22 GMT+09:00",
    audioPath: URL(fileURLWithPath: URL.getPath(fileName: "20231203233522", type: .audio).path()),
    videoPath: URL(fileURLWithPath: URL.getPath(fileName: "20231203233522", type: .video).path()),
    utterances: [],
    words: [],
     sentences: [],
     summary: PracticeSummaryModel(),
    remarkable: false,
    projectCreatAt:"2023. 12. 3. 오후 11:31"
    )
//
    var summary = PracticeSummaryModel(
        syllableSum: 1341,
        durationSum: 187924,
        wordCount: 533,
        fillerWordCount: 1,
        eachFillerWordCount: [
            FillerWordModel(fillerWord:"음", count: 0),
            FillerWordModel(fillerWord:"흠", count: 0),
            FillerWordModel(fillerWord:"봐봐", count: 0),
            FillerWordModel(fillerWord:"뭔가", count: 0),
            FillerWordModel(fillerWord:"사실은", count: 0),
            FillerWordModel(fillerWord:"뭐였지", count: 0),
            FillerWordModel(fillerWord:"그러니까", count: 0),
            FillerWordModel(fillerWord:"아니", count: 0),
            FillerWordModel(fillerWord:"뭐", count: 0),
            FillerWordModel(fillerWord:"인제", count: 0),
            FillerWordModel(fillerWord:"뭐였더라", count: 0),
            FillerWordModel(fillerWord:"막", count: 0),
            FillerWordModel(fillerWord:"약간", count: 0),
            FillerWordModel(fillerWord:"아", count: 0),
            FillerWordModel(fillerWord:"어", count: 0),
            FillerWordModel(fillerWord:"근데", count: 0),
            FillerWordModel(fillerWord:"뭐지", count: 0),
            FillerWordModel(fillerWord:"그니깐", count: 0),
            FillerWordModel(fillerWord:"저기", count: 0),
            FillerWordModel(fillerWord:"그래서", count: 0),
            FillerWordModel(fillerWord:"이제", count: 1)
        ],
        fastSentenceIndex: [25],
        slowSentenceIndex: [],
        spmAverage: 428.15180604925393,
        practiceLength: 256.42133333333334,
        fwpm:  0.2339898916366813
    )
    // maxSpm = 566.03773584905662
    // minSpm = 343.2629710001973
//    UtteranceModel(
//        startAt: 32640,
//        duration: 4829,
//        message: "제가 일주일간 스터드 를 모집 했었는데요 여러분들의 여러 관심 덕분에 최종 3 0 명의 오게 되었습니다."
//    ),
    var utterance = [
        UtteranceModel(
        startAt: 78840,
        duration: 5069,
        message: "이미 여러분들이 알고 계신 대로 1 2 월 사 일과 5 일에 걸쳐서 는 오리엔테이션 이 진행 됩니다."
        ),
        UtteranceModel(
        startAt: 232590,
        duration: 2219,
        message: "본인의 일정에 맞게 부담없이 말씀해 주세요."
        ),
        UtteranceModel(
        startAt: 84960,
        duration: 5339,
        message: "앞에서 사이클 마다 각 팀별로 주제를 정해 공부한 내용들을 공유 할 예정이라고 말씀 드렸는데요."
        ),
        UtteranceModel(
        startAt: 251820,
        duration: 1439,
        message: "지금까지 들어서 감사합니다."
        ),
        UtteranceModel(
        startAt: 131460,
        duration: 4289,
        message: "각 팀들은 본인 주차 의 맞춰 내가 근무 공유 해 주시면 감사하겠습니다."
        ),
        UtteranceModel(
        startAt: 18150,
        duration: 7110,
        message: "오늘 오리엔테이션 에서는 디그다 방향성을 간단하게 말씀 드리고 앞으로 9 개월 동안 의 스케줄에 대해서 설명해 드리려고 합니다."
        ),
        UtteranceModel(
        startAt: 207930,
        duration: 5669,
        message: "각 팀에서는 프레젠테이션 과 Notion 템플릿 을 잘 지켜 공유 자를 만들어 주면 감사하겠습니다."
        ),
        UtteranceModel(
        startAt: 146970,
        duration: 4139,
        message: "한명씩 마다 5 분 정도 간단하게 구매 하는 시간을 가져 올까 합니다."
        ),
        UtteranceModel(
        startAt: 156810,
        duration: 4770,
        message: "개인적으로 스터디 원대가 나누고 싶은 이야기들이 있으신 모든 분들께 해당 될 수 있습니다."
        ),
        UtteranceModel(
        startAt: 40170,
        duration: 4860,
        message: "싸이클 마다 각 팀별로 주제를 정해 공부한 내용들을 공유 할 예정입니다."
        ),
        UtteranceModel(
        startAt: 168060,
        duration: 1979,
        message: "3 0 분 의 시간을 배정 받게 됩니다."
        ),
        UtteranceModel(
        startAt: 109200,
        duration: 2310,
        message: "구체적인 나 사이클 일정에 대해 말씀드리겠습니다."
        ),
        UtteranceModel(
        startAt: 226800,
        duration: 4919,
        message: "한 싸이클이 끝날 때마다 스터디 년 들은 자유롭게 합류 하고 떠나는 것이 가능합니다."
        ),
        UtteranceModel(
        startAt: 241440,
        duration: 5220,
        message: "여기까지가 아카데미 에서 진행하는 저희 프로젝트 디자인 스터디 디그다 에 대한 전반적인 소개 없고."
        ),
        UtteranceModel(
        startAt: 48870,
        duration: 3210,
        message: "사이클 에 대한 자세한 설명은 뒤에서 다시 해 드리도록 하겠습니다."
        ),
        UtteranceModel(
        startAt: 216090,
        duration: 4019,
        message: "마지막으로 스터디 가입 및 탈퇴에 대해 설명 드리고 마치도록 하겠습니다."
        ),
        UtteranceModel(
        startAt: 154530,
        duration: 1770,
        message: "개인적으로 탐구 해 본 여길 수 있는 등."
        ),
        UtteranceModel(
        startAt: 117930,
        duration: 6600,
        message: "둘째 주 부터 넷째 주 까지는 매주 랜덤으로 세팀 씩 팀끼리 공부한 내용에 대해 공유 하는 시간이 될 예정입니다."
        ),
        UtteranceModel(
        startAt: 187440,
        duration: 6900,
        message: "하지만 여기 후관 내지 말고 팀에서 탐구 하고 토론 하며 공부해 보고 싶은 주제를 찾아 보는 것을 추천 드립니다."
        ),
        UtteranceModel(
        startAt: 65519,
        duration: 3030,
        message: "이처럼 다양한 전공 문자를 가진 사람들이 모인 스터디 기때문에."
        ),
        UtteranceModel(
        startAt: 58800,
        duration: 1170,
        message: "기획 관련 2 5 %."
        ),
        UtteranceModel(
        startAt: 126480,
        duration: 4440,
        message: "첫째 주 팀빌딩 이후 각 주차 별로 구매 할 팀들이 랜덤으로 배정 되니."
        ),
        UtteranceModel(
        startAt: 152400,
        duration: 1410,
        message: "본인의 전공과 관련 내용이 수도 있고."
        ),
        UtteranceModel(
        startAt: 10469,
        duration: 840,
        message: "안녕하세요 여러분."
        ),
        UtteranceModel(
        startAt: 112170,
        duration: 5069,
        message: "한 사이클 에서 첫째는 팀 빌딩 과 함께 각 팀별로 주제 선정 하는 시간 이며."
        ),
        UtteranceModel(
        startAt: 29759,
        duration: 3750,
        message: "여러분들의 열렬한 관심 덕분에 최종 3 1 명이 모이게 되었습니다."
        ),
        UtteranceModel(
        startAt: 136710,
        duration: 4679,
        message: "둘째주 에서 늦어 주까지는 팀 세션 이해해도 개인 세션 준비하고 있는데요."
        ),
        UtteranceModel(
        startAt: 164010,
        duration: 3479,
        message: "스터디는 하루 평균 두 시간씩 될 예정이며 각 팀들은."
        ),
        UtteranceModel(
        startAt: 183840,
        duration: 2400,
        message: "구체적인 주제는 이런 식에 될 수 있을 것 같습니다."
        ),
        UtteranceModel(
        startAt: 220920,
        duration: 1200,
        message: "앞에서 말씀드렸듯이."
        ),
        UtteranceModel(
        startAt: 69060,
        duration: 5189,
        message: "다양한 배경을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 이야기 할 수 있습니다."
        ),
        UtteranceModel(
        startAt: 91080,
        duration: 4439,
        message: "한 달을 한 사이클 로 잡고 구 개월간 총 아홉 번의 싸이클이 진행 됩니다."
        ),
        UtteranceModel(
        startAt: 145500,
        duration: 810,
        message: "각 주차 별로."
        ),
        UtteranceModel(
        startAt: 177090,
        duration: 1319,
        message: "주제 제한은 따로 없으며."
        ),
        UtteranceModel(
        startAt: 54089,
        duration: 4020,
        message: "스터디 들의 전국 문화를 조사해 본 결과 각 각 개발 관련 2 9 %."
        ),
        UtteranceModel(
        startAt: 35520,
        duration: 3960,
        message: "4 명 혹은 세 명씩 한 팀을 이루 총 여덟 팀으로 아니게 될 예정이며."
        ),
        UtteranceModel(
        startAt: 247320,
        duration: 3719,
        message: "궁금한 점이 있다면 언제든지 저희 운영진 에게 편하게 질문 해 주세요."
        ),
        UtteranceModel(
        startAt: 201270,
        duration: 5729,
        message: "1 6 대구 비율에 프레젠테이션 자료 들과 Notion 은 텍스트로 모아 볼 예정입니다."
        ),
        UtteranceModel(
        startAt: 75869,
        duration: 1980,
        message: "이제 일정을 공유 해 드리도록 하겠습니다."
        ),
        UtteranceModel(
        startAt: 96870,
        duration: 8069,
        message: "저희 스터디는 앞으로 매주 월요일 저녁 6 시에 지금 오리엔테이션 하고 있는 포항공대 십 파이브 건물 오층 메인 랩 에서 진행 되니."
        ),
        UtteranceModel(
        startAt: 105450,
        duration: 1709,
        message: "이지 말고 참석 부탁드립니다."
        ),
        UtteranceModel(
        startAt: 179010,
        duration: 2789,
        message: "팀에서 탐구 해 보고 싶은 주제 라면 오늘 괜찮습니다."
        ),
        UtteranceModel(
        startAt: 141960,
        duration: 2969,
        message: "중간 중간 개인적으로 구매 하고 싶은 내용들이 있는 분들은."
        ),
        UtteranceModel(
        startAt: 172080,
        duration: 4229,
        message: "매 사이클 첫째 주에 진행되는 주제 선정 과 관련해서 말씀드리도록 하겠습니다."
        ),
        UtteranceModel(
        startAt: 235770,
        duration: 3780,
        message: "새로운 사이클을 시작 되기 최선 일주일 전에만 말씀하시면 감사하겠습니다."
        ),
        UtteranceModel(
        startAt: 26880,
        duration: 2160,
        message: "지난 일주일간 스터디를 모집 했었는데요."
        ),
        UtteranceModel(
        startAt: 60750,
        duration: 2669,
        message: "디자인 관련이 5 6 % 의 비율을 찾아 하고 있었습니다."
        ),
        UtteranceModel(
        startAt: 45870,
        duration: 2280,
        message: "한 싸이클 의 총 8 개 주제가 나오게 되겠죠."
        ),
        UtteranceModel(
        startAt: 222630,
        duration: 3659,
        message: "스터디는 한 달에 한 싸이클 씩 총 아홉 사이클 로 이루어져 있으며."
        ),
        UtteranceModel(
        startAt: 11879,
        duration: 5460,
        message: "아카데미 에서 진행하는 저희 프로젝트 디자인 스터디 디그다 의 참여해 주셔서 감사합니다."
        ),
        UtteranceModel(
        startAt: 196680,
        duration: 3689,
        message: "9개월 간의 스토리가 끝나면 그동안에 결과물로 갈비 하려고 합니다."
        )
    ]
//    WordModel(
//        isFillerWord: false,
//        sentenceIndex: 2,
//        index: 34,
//        word: "스터드  "
//    ),
    var words = [
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 61,
        word: "싸이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 20,
        word: "말씀 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 328,
        word: "탐구 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 429,
        word: "비율에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 433,
        word: "Notion "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 388,
        word: "괜찮습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 469,
        word: "싸이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 92,
        word: "들의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 382,
        word: "해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 425,
        word: "합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 411,
        word: "주제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 1,
        word: "여러분. "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 438,
        word: "예정입니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 39,
        word: "관심 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 219,
        word: "참석 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 409,
        word: "보고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 301,
        word: "하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 483,
        word: "들은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 346,
        word: "수 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 175,
        word: "내용들을 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 12,
        index: 143,
        word: "이제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 180,
        word: "드렸는데요."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 116,
        word: "비율을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 107,
        word: "2 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 162,
        word: "는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 252,
        word: "팀끼리 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 419,
        word: "스토리가 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 208,
        word: "십 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 254,
        word: "내용에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 131,
        word: "가진 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 276,
        word: "본인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 366,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 253,
        word: "공부한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 490,
        word: "본인의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 177,
        word: "할 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 378,
        word: "따로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 96,
        word: "본 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 461,
        word: "마치도록 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 467,
        word: "달에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 236,
        word: "팀별로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 249,
        word: "랜덤으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 296,
        word: "있는데요."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 129,
        word: "다양한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 99,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 238,
        word: "선정 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 493,
        word: "부담없이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 23,
        word: "9 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 504,
        word: "감사하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 251,
        word: "씩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 317,
        word: "시간을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 153,
        word: "대로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 357,
        word: "3 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 49,
        word: "혹은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 218,
        word: "말고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 50,
        word: "세 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 179,
        word: "말씀 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 505,
        word: "여기까지가 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 401,
        word: "내지 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 325,
        word: "수도 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 379,
        word: "없으며. "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 397,
        word: "같습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 338,
        word: "나누고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 28,
        word: "대해서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 102,
        word: "2 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 347,
        word: "있습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 323,
        word: "관련 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 266,
        word: "주차 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 125,
        word: "사람들이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 430,
        word: "프레젠테이션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 231,
        word: "팀 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 305,
        word: "분들은."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 223,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 510,
        word: "프로젝트 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 314,
        word: "간단하게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 112,
        word: "5 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 311,
        word: "5 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 233,
        word: "과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 171,
        word: "팀별로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 176,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 402,
        word: "말고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 29,
        word: "설명해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 500,
        word: "최선 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 94,
        word: "문화를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 322,
        word: "전공과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 261,
        word: "첫째 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 58,
        word: "아니게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 448,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 434,
        word: "은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 386,
        word: "라면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 216,
        word: "되니."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 334,
        word: "등."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 262,
        word: "주 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 41,
        index: 519,
        word: "궁금한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 426,
        word: "1 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 76,
        word: "8 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 65,
        word: "주제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 385,
        word: "주제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 481,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 237,
        word: "주제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 145,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 288,
        word: "늦어 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 117,
        word: "찾아 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 336,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 147,
        word: "드리도록 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 355,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 83,
        word: "대한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 286,
        word: "둘째주 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 70,
        word: "할 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 114,
        word: "% "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 360,
        word: "의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 36,
        word: "했었는데요."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 69,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 454,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 215,
        word: "진행 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 375,
        word: "하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 178,
        word: "예정이라고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 279,
        word: "맞춰 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 224,
        word: "일정에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 211,
        word: "오층 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 264,
        word: "이후 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 495,
        word: "주세요."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 105,
        word: "기획 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 306,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 413,
        word: "보는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 482,
        word: "년 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 331,
        word: "여길 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 3,
        word: "에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 295,
        word: "준비하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 291,
        word: "세션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 123,
        word: "문자를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 139,
        word: "이야기 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 478,
        word: "싸이클이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 396,
        word: "것 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 308,
        word: "별로. "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 260,
        word: "예정입니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 137,
        word: "바라 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 164,
        word: "이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 335,
        word: "개인적으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 37,
        word: "여러분들의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 87,
        word: "다시 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 475,
        word: "이루어져 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 400,
        word: "후관 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 26,
        word: "의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 214,
        word: "에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 340,
        word: "이야기들이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 292,
        word: "이해해도 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 277,
        word: "주차 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 109,
        word: "%. "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 220,
        word: "부탁드립니다. "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 477,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 404,
        word: "탐구 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 235,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 245,
        word: "넷째 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 349,
        word: "하루 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 248,
        word: "매주 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 43,
        word: "1 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 255,
        word: "대해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 362,
        word: "배정 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 406,
        word: "토론 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 213,
        word: "랩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 503,
        word: "말씀하시면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 67,
        word: "공부한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 300,
        word: "구매 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 198,
        word: "매주 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 60,
        word: "예정이며."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 320,
        word: "합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 431,
        word: "자료 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 68,
        word: "내용들을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 256,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 445,
        word: "을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 44,
        word: "명이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 432,
        word: "들과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 169,
        word: "마다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 241,
        word: "이며."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 512,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 181,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 151,
        word: "알고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 100,
        word: "개발 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 372,
        word: "과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 41,
        word: "최종 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 146,
        word: "해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 41,
        index: 527,
        word: "질문 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 89,
        word: "드리도록 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 133,
        word: "서로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 64,
        word: "팀별로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 159,
        word: "5 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 41,
        index: 528,
        word: "해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 75,
        word: "총 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 115,
        word: "의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 436,
        word: "모아 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 274,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 42,
        index: 531,
        word: "들어서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 40,
        word: "덕분에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 381,
        word: "탐구 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 363,
        word: "받게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 307,
        word: "주차 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 222,
        word: "나 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 108,
        word: "5 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 10,
        word: "의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 21,
        word: "드리고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 466,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 47,
        word: "4 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 98,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 72,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 513,
        word: "디그다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 158,
        word: "일과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 113,
        word: "6 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 205,
        word: "하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 41,
        index: 524,
        word: "운영진 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 27,
        word: "스케줄에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 517,
        word: "소개 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 0,
        word: "안녕하세요 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 420,
        word: "끝나면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 22,
        word: "앞으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 73,
        word: "싸이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 518,
        word: "없고."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 440,
        word: "팀에서는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 405,
        word: "하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 130,
        word: "배경을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 304,
        word: "있는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 486,
        word: "하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 71,
        word: "예정입니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 193,
        word: "진행 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 132,
        word: "사람들과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 472,
        word: "아홉 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 206,
        word: "있는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 339,
        word: "싶은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 182,
        word: "달을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 110,
        word: "디자인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 351,
        word: "두 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 480,
        word: "때마다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 148,
        word: "하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 456,
        word: "및 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 243,
        word: "주 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 165,
        word: "진행 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 327,
        word: "개인적으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 12,
        word: "주셔서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 156,
        word: "월 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 230,
        word: "첫째는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 30,
        word: "드리려고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 361,
        word: "시간을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 474,
        word: "로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 161,
        word: "걸쳐서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 487,
        word: "떠나는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 473,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 172,
        word: "주제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 197,
        word: "앞으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 41,
        index: 525,
        word: "에게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 514,
        word: "에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 299,
        word: "개인적으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 350,
        word: "평균 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 25,
        word: "동안 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 485,
        word: "합류 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 462,
        word: "하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 345,
        word: "될 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 118,
        word: "하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 443,
        word: "Notion "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 38,
        word: "열렬한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 226,
        word: "말씀드리겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 441,
        word: "프레젠테이션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 97,
        word: "결과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 15,
        word: "오리엔테이션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 442,
        word: "과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 501,
        word: "일주일 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 341,
        word: "있으신 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 55,
        word: "총 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 204,
        word: "오리엔테이션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 221,
        word: "구체적인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 228,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 85,
        word: "설명은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 207,
        word: "포항공대 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 343,
        word: "분들께 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 348,
        word: "스터디는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 163,
        word: "오리엔테이션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 418,
        word: "간의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 374,
        word: "말씀드리도록 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 416,
        word: "드립니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 463,
        word: "앞에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 155,
        word: "2 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 289,
        word: "주까지는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 476,
        word: "있으며."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 446,
        word: "잘 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 494,
        word: "말씀해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 337,
        word: "원대가 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 53,
        word: "팀을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 452,
        word: "감사하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 506,
        word: "아카데미 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 80,
        word: "되겠죠."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 186,
        word: "잡고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 298,
        word: "중간 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 303,
        word: "내용들이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 232,
        word: "빌딩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 74,
        word: "의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 13,
        word: "감사합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 56,
        word: "여덟 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 439,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 479,
        word: "끝날 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 41,
        index: 529,
        word: "주세요."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 387,
        word: "오늘 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 310,
        word: "마다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 32,
        word: "지난 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 265,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 200,
        word: "저녁 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 284,
        word: "주시면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 507,
        word: "에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 417,
        word: "9개월 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 103,
        word: "9 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 471,
        word: "총 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 389,
        word: "구체적인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 324,
        word: "내용이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 152,
        word: "계신 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 270,
        word: "팀들이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 516,
        word: "전반적인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 399,
        word: "여기 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 393,
        word: "될 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 332,
        word: "수 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 377,
        word: "제한은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 281,
        word: "근무 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 17,
        word: "디그다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 250,
        word: "세팀 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 468,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 302,
        word: "싶은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 258,
        word: "시간이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 309,
        word: "한명씩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 367,
        word: "첫째 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 509,
        word: "저희 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 437,
        word: "볼 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 160,
        word: "일에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 352,
        word: "시간씩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 141,
        word: "수 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 184,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 460,
        word: "드리고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 24,
        word: "개월 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 173,
        word: "정해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 273,
        word: "되니."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 330,
        word: "본 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 128,
        word: "기때문에."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 35,
        word: "모집 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 88,
        word: "해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 278,
        word: "의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 242,
        word: "둘째 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 41,
        index: 520,
        word: "점이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 368,
        word: "주에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 79,
        word: "나오게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 90,
        word: "하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 51,
        word: "명씩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 470,
        word: "씩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 59,
        word: "될 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 57,
        word: "팀으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 497,
        word: "사이클을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 150,
        word: "여러분들이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 395,
        word: "있을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 209,
        word: "파이브 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 282,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 167,
        word: "앞에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 119,
        word: "있었습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 458,
        word: "대해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 358,
        word: "0 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 45,
        word: "모이게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 66,
        word: "정해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 229,
        word: "에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 168,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 263,
        word: "팀빌딩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 142,
        word: "있습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 459,
        word: "설명 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 63,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 101,
        word: "관련 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 203,
        word: "지금 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 447,
        word: "지켜 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 450,
        word: "만들어 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 5,
        word: "저희 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 464,
        word: "말씀드렸듯이. "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 373,
        word: "관련해서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 391,
        word: "이런 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 515,
        word: "대한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 4,
        word: "진행하는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 9,
        word: "디그다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 280,
        word: "내가 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 415,
        word: "추천 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 403,
        word: "팀에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 246,
        word: "주 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 421,
        word: "그동안에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 41,
        index: 523,
        word: "저희 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 318,
        word: "가져 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 52,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 149,
        word: "이미 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 353,
        word: "될 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 194,
        word: "됩니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 285,
        word: "감사하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 86,
        word: "뒤에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 188,
        word: "개월간 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 369,
        word: "진행되는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 41,
        index: 522,
        word: "언제든지 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 297,
        word: "중간 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 384,
        word: "싶은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 111,
        word: "관련이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 455,
        word: "가입 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 144,
        word: "일정을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 287,
        word: "에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 174,
        word: "공부한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 342,
        word: "모든 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 42,
        word: "3 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 423,
        word: "갈비 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 435,
        word: "텍스트로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 424,
        word: "하려고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 91,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 354,
        word: "예정이며 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 239,
        word: "하는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 319,
        word: "올까 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 185,
        word: "로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 199,
        word: "월요일 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 370,
        word: "주제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 272,
        word: "배정 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 196,
        word: "스터디는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 444,
        word: "템플릿 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 451,
        word: "주면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 489,
        word: "가능합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 267,
        word: "별로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 247,
        word: "까지는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 48,
        word: "명 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 268,
        word: "구매 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 104,
        word: "%."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 312,
        word: "분 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 126,
        word: "모인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 2,
        word: "아카데미 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 359,
        word: "분 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 316,
        word: "하는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 407,
        word: "하며 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 183,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 138,
        word: "보고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 127,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 84,
        word: "자세한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 240,
        word: "시간 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 78,
        word: "주제가 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 484,
        word: "자유롭게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 121,
        word: "다양한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 499,
        word: "되기 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 457,
        word: "탈퇴에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 42,
        index: 530,
        word: "지금까지 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 212,
        word: "메인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 414,
        word: "것을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 202,
        word: "시에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 140,
        word: "할 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 166,
        word: "됩니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 225,
        word: "대해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 217,
        word: "이지 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 410,
        word: "싶은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 41,
        index: 526,
        word: "편하게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 62,
        word: "마다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 234,
        word: "함께 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 376,
        word: "주제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 81,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 190,
        word: "아홉 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 498,
        word: "시작 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 511,
        word: "디자인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 37,
        index: 488,
        word: "것이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 333,
        word: "있는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 8,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 392,
        word: "식에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 365,
        word: "매 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 271,
        word: "랜덤으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 269,
        word: "할 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 35,
        index: 453,
        word: "마지막으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 275,
        word: "팀들은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 14,
        word: "오늘 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 244,
        word: "부터 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 390,
        word: "주제는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 210,
        word: "건물 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 502,
        word: "전에만 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 329,
        word: "해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 394,
        word: "수 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 82,
        word: "에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 54,
        word: "이루 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 283,
        word: "해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 191,
        word: "번의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 7,
        word: "디자인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 32,
        index: 422,
        word: "결과물로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 31,
        word: "합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 6,
        word: "프로젝트 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 135,
        word: "관점에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 34,
        index: 449,
        word: "자를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 294,
        word: "세션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 380,
        word: "팀에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 77,
        word: "개 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 321,
        word: "본인의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 93,
        word: "전국 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 227,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 18,
        word: "방향성을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 201,
        word: "6 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 189,
        word: "총 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 364,
        word: "됩니다. "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 398,
        word: "하지만 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 124,
        word: "가진 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 136,
        word: "주제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 40,
        index: 508,
        word: "진행하는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 170,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 344,
        word: "해당 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 408,
        word: "공부해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 36,
        index: 465,
        word: "스터디는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 195,
        word: "저희 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 313,
        word: "정도 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 19,
        word: "간단하게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 11,
        word: "참여해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 42,
        index: 532,
        word: "감사합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 134,
        word: "다른 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 412,
        word: "찾아 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 491,
        word: "일정에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 39,
        index: 496,
        word: "새로운 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 259,
        word: "될 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 326,
        word: "있고. "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 41,
        index: 521,
        word: "있다면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 428,
        word: "대구 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 95,
        word: "조사해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 33,
        index: 427,
        word: "6 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 154,
        word: "1 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 315,
        word: "구매 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 157,
        word: "사 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 356,
        word: "팀들은."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 187,
        word: "구 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 192,
        word: "싸이클이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 122,
        word: "전공 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 371,
        word: "선정 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 46,
        word: "되었습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 106,
        word: "관련 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 257,
        word: "하는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 383,
        word: "보고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 34,
        word: "스터디를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 120,
        word: "이처럼 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 38,
        index: 492,
        word: "맞게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 293,
        word: "개인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 16,
        word: "에서는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 290,
        word: "팀 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 33,
        word: "일주일간 "
        )
    ]
//    SentenceModel(
//        index: 6,
//        sentence: "이제 그 다양한 전공 분야를 가진 사람들이 모인 스터디기때문에.",
//        startAt: 64470,
//        endAt: 70170,
//        spmValue: 273.6842105263158
//    ),
    var sentences = [
        SentenceModel(
        index: 39,
        sentence: "새로운 사이클을 시작 되기 최선 일주일 전에만 말씀하시면 감사하겠습니다.",
        startAt: 235770,
        endAt: 239550,
        spmValue: 492.06349206349205
        ),
        SentenceModel(
        index: 32,
        sentence: "9개월 간의 스토리가 끝나면 그동안에 결과물로 갈비 하려고 합니다.",
        startAt: 196680,
        endAt: 200369,
        spmValue: 455.4079696394687
        ),
        SentenceModel(
        index: 28,
        sentence: "3 0 분 의 시간을 배정 받게 됩니다. 매 사이클 첫째 주에 진행되는 주제 선정 과 관련해서 말씀드리도록 하겠습니다.",
        startAt: 168060,
        endAt: 176309,
        spmValue: 444.58762886597935
        ),
        SentenceModel(
        index: 36,
        sentence: "앞에서 말씀드렸듯이. 스터디는 한 달에 한 싸이클 씩 총 아홉 사이클 로 이루어져 있으며.",
        startAt: 220920,
        endAt: 226289,
        spmValue: 432.18769294093437
        ),
        SentenceModel(
        index: 24,
        sentence: "각 주차 별로. 한명씩 마다 5 분 정도 간단하게 구매 하는 시간을 가져 올까 합니다.",
        startAt: 145500,
        endAt: 151109,
        spmValue: 387.9571630632451
        ),
        SentenceModel(
        index: 34,
        sentence: "각 팀에서는 프레젠테이션 과 Notion 템플릿 을 잘 지켜 공유 자를 만들어 주면 감사하겠습니다.",
        startAt: 207930,
        endAt: 213599,
        spmValue: 433.9389663079908
        ),
        SentenceModel(
        index: 29,
        sentence: "주제 제한은 따로 없으며. 팀에서 탐구 해 보고 싶은 주제 라면 오늘 괜찮습니다.",
        startAt: 177090,
        endAt: 181799,
        spmValue: 452.77507302823756
        ),
        SentenceModel(
        index: 3,
        sentence: "여러분들의 열렬한 관심 덕분에 최종 3 1 명이 모이게 되었습니다.",
        startAt: 29759,
        endAt: 33509,
        spmValue: 432.0
        ),
        SentenceModel(
        index: 21,
        sentence: "각 팀들은 본인 주차 의 맞춰 내가 근무 공유 해 주시면 감사하겠습니다.",
        startAt: 131460,
        endAt: 135749,
        spmValue: 391.69969689904406
        ),
        SentenceModel(
        index: 13,
        sentence: "이미 여러분들이 알고 계신 대로 1 2 월 사 일과 5 일에 걸쳐서 는 오리엔테이션 이 진행 됩니다.",
        startAt: 78840,
        endAt: 83909,
        spmValue: 449.79285855198265
        ),
        SentenceModel(
        index: 30,
        sentence: "구체적인 주제는 이런 식에 될 수 있을 것 같습니다.",
        startAt: 183840,
        endAt: 186240,
        spmValue: 500.0
        ),
        SentenceModel(
        index: 42,
        sentence: "지금까지 들어서 감사합니다.",
        startAt: 251820,
        endAt: 253259,
        spmValue: 500.3474635163308
        ),
        SentenceModel(
        index: 8,
        sentence: "스터디 들의 전국 문화를 조사해 본 결과 각 각 개발 관련 2 9 %.",
        startAt: 54089,
        endAt: 58109,
        spmValue: 373.13432835820896
        ),
        SentenceModel(
        index: 26,
        sentence: "개인적으로 스터디 원대가 나누고 싶은 이야기들이 있으신 모든 분들께 해당 될 수 있습니다.",
        startAt: 156810,
        endAt: 161580,
        spmValue: 465.40880503144655
        ),
        SentenceModel(
        index: 37,
        sentence: "한 싸이클이 끝날 때마다 스터디 년 들은 자유롭게 합류 하고 떠나는 것이 가능합니다.",
        startAt: 226800,
        endAt: 231719,
        spmValue: 414.7184387070543
        ),
        SentenceModel(
        index: 10,
        sentence: "이처럼 다양한 전공 문자를 가진 사람들이 모인 스터디 기때문에.",
        startAt: 65519,
        endAt: 68549,
        spmValue: 514.8514851485148
        ),
        SentenceModel(
        index: 41,
        sentence: "궁금한 점이 있다면 언제든지 저희 운영진 에게 편하게 질문 해 주세요.",
        startAt: 247320,
        endAt: 251039,
        spmValue: 451.734337187416
        ),
        SentenceModel(
        index: 5,
        sentence: "싸이클 마다 각 팀별로 주제를 정해 공부한 내용들을 공유 할 예정입니다.",
        startAt: 40170,
        endAt: 45030,
        spmValue: 358.0246913580247
        ),
        SentenceModel(
        index: 12,
        sentence: "이제 일정을 공유 해 드리도록 하겠습니다.",
        startAt: 75869,
        endAt: 77849,
        spmValue: 515.1515151515151
        ),
        SentenceModel(
        index: 35,
        sentence: "마지막으로 스터디 가입 및 탈퇴에 대해 설명 드리고 마치도록 하겠습니다.",
        startAt: 216090,
        endAt: 220109,
        spmValue: 447.87260512565314
        ),
        SentenceModel(
        index: 16,
        sentence: "저희 스터디는 앞으로 매주 월요일 저녁 6 시에 지금 오리엔테이션 하고 있는 포항공대 십 파이브 건물 오층 메인 랩 에서 진행 되니.",
        startAt: 96870,
        endAt: 104939,
        spmValue: 386.6650142520758
        ),
        SentenceModel(
        index: 0,
        sentence: "안녕하세요 여러분. 아카데미 에서 진행하는 저희 프로젝트 디자인 스터디 디그다 의 참여해 주셔서 감사합니다.",
        startAt: 10469,
        endAt: 17339,
        spmValue: 428.57142857142856
        ),
        SentenceModel(
        index: 7,
        sentence: "사이클 에 대한 자세한 설명은 뒤에서 다시 해 드리도록 하겠습니다.",
        startAt: 48870,
        endAt: 52080,
        spmValue: 504.67289719626166
        ),
        SentenceModel(
        index: 9,
        sentence: "기획 관련 2 5 %. 디자인 관련이 5 6 % 의 비율을 찾아 하고 있었습니다.",
        startAt: 58800,
        endAt: 63419,
        spmValue: 453.24303203959363
        ),
        SentenceModel(
        index: 2,
        sentence: "지난 일주일간 스터디를 모집 했었는데요.",
        startAt: 26880,
        endAt: 29040,
        spmValue: 472.22222222222223
        ),
        SentenceModel(
        index: 40,
        sentence: "여기까지가 아카데미 에서 진행하는 저희 프로젝트 디자인 스터디 디그다 에 대한 전반적인 소개 없고.",
        startAt: 241440,
        endAt: 246660,
        spmValue: 471.264367816092
        ),
        SentenceModel(
        index: 18,
        sentence: "한 사이클 에서 첫째는 팀 빌딩 과 함께 각 팀별로 주제 선정 하는 시간 이며.",
        startAt: 112170,
        endAt: 117239,
        spmValue: 343.2629710001973
        ),
        SentenceModel(
        index: 23,
        sentence: "중간 중간 개인적으로 구매 하고 싶은 내용들이 있는 분들은.",
        startAt: 141960,
        endAt: 144929,
        spmValue: 485.01178848097004
        ),
        SentenceModel(
        index: 20,
        sentence: "첫째 주 팀빌딩 이후 각 주차 별로 구매 할 팀들이 랜덤으로 배정 되니.",
        startAt: 126480,
        endAt: 130920,
        spmValue: 364.86486486486484
        ),
        SentenceModel(
        index: 6,
        sentence: "한 싸이클 의 총 8 개 주제가 나오게 되겠죠.",
        startAt: 45870,
        endAt: 48150,
        spmValue: 447.36842105263156
        ),
        SentenceModel(
        index: 11,
        sentence: "다양한 배경을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 이야기 할 수 있습니다.",
        startAt: 69060,
        endAt: 74249,
        spmValue: 416.26517633455387
        ),
        SentenceModel(
        index: 1,
        sentence: "오늘 오리엔테이션 에서는 디그다 방향성을 간단하게 말씀 드리고 앞으로 9 개월 동안 의 스케줄에 대해서 설명해 드리려고 합니다.",
        startAt: 18150,
        endAt: 25260,
        spmValue: 447.25738396624473
        ),
        SentenceModel(
        index: 14,
        sentence: "앞에서 사이클 마다 각 팀별로 주제를 정해 공부한 내용들을 공유 할 예정이라고 말씀 드렸는데요.",
        startAt: 84960,
        endAt: 90299,
        spmValue: 438.2843229069114
        ),
        SentenceModel(
        index: 17,
        sentence: "이지 말고 참석 부탁드립니다. 구체적인 나 사이클 일정에 대해 말씀드리겠습니다.",
        startAt: 105450,
        endAt: 111510,
        spmValue: 492.65986563821843
        ),
        SentenceModel(
        index: 15,
        sentence: "한 달을 한 사이클 로 잡고 구 개월간 총 아홉 번의 싸이클이 진행 됩니다.",
        startAt: 91080,
        endAt: 95519,
        spmValue: 378.46361793196667
        ),
        SentenceModel(
        index: 19,
        sentence: "둘째 주 부터 넷째 주 까지는 매주 랜덤으로 세팀 씩 팀끼리 공부한 내용에 대해 공유 하는 시간이 될 예정입니다.",
        startAt: 117930,
        endAt: 124530,
        spmValue: 400.0
        ),
        SentenceModel(
        index: 4,
        sentence: "4 명 혹은 세 명씩 한 팀을 이루 총 여덟 팀으로 아니게 될 예정이며.",
        startAt: 35520,
        endAt: 39480,
        spmValue: 393.93939393939394
        ),
        SentenceModel(
        index: 27,
        sentence: "스터디는 하루 평균 두 시간씩 될 예정이며 각 팀들은.",
        startAt: 164010,
        endAt: 167489,
        spmValue: 362.17303822937623
        ),
        SentenceModel(
        index: 25,
        sentence: "본인의 전공과 관련 내용이 수도 있고. 개인적으로 탐구 해 본 여길 수 있는 등.",
        startAt: 152400,
        endAt: 156300,
        spmValue: 566.0377358490566
        ),
        SentenceModel(
        index: 31,
        sentence: "하지만 여기 후관 내지 말고 팀에서 탐구 하고 토론 하며 공부해 보고 싶은 주제를 찾아 보는 것을 추천 드립니다.",
        startAt: 187440,
        endAt: 194340,
        spmValue: 382.60869565217394
        ),
        SentenceModel(
        index: 33,
        sentence: "1 6 대구 비율에 프레젠테이션 자료 들과 Notion 은 텍스트로 모아 볼 예정입니다.",
        startAt: 201270,
        endAt: 206999,
        spmValue: 377.0291499389073
        ),
        SentenceModel(
        index: 22,
        sentence: "둘째주 에서 늦어 주까지는 팀 세션 이해해도 개인 세션 준비하고 있는데요.",
        startAt: 136710,
        endAt: 141389,
        spmValue: 384.69758495405
        ),
        SentenceModel(
        index: 38,
        sentence: "본인의 일정에 맞게 부담없이 말씀해 주세요.",
        startAt: 232590,
        endAt: 234809,
        spmValue: 486.70572329878325
        )
    ]
}

class SampleDigDaPracticesMock3 {
    static var shared = SampleDigDaPracticesMock3()
    
    private init() {}
    
    let practice = PracticeModel(
    practiceName: "세번째 연습",
    index: 2,
    isVisited: true,
    creatAt: "2023-12-03 23:42:11 GMT+09:00",
    audioPath: URL(fileURLWithPath: URL.getPath(fileName: "20231203234211", type: .audio).path()),
    videoPath: URL(fileURLWithPath: URL.getPath(fileName: "20231203234211", type: .video).path()),
    utterances: [],
    words: [],
     sentences: [],
     summary: PracticeSummaryModel(),
    remarkable: false,
    projectCreatAt:"2023. 12. 3. 오후 11:31"
    )
    
    var summary = PracticeSummaryModel(
        syllableSum: 1368,
        durationSum: 206982,
        wordCount: 578,
        fillerWordCount: 19,
        eachFillerWordCount: [
            FillerWordModel(fillerWord:"어", count: 4),
            FillerWordModel(fillerWord:"뭐지", count: 0),
            FillerWordModel(fillerWord:"뭐였더라", count: 0),
            FillerWordModel(fillerWord:"음", count: 0),
            FillerWordModel(fillerWord:"인제", count: 0),
            FillerWordModel(fillerWord:"아", count: 0),
            FillerWordModel(fillerWord:"뭐였지", count: 0),
            FillerWordModel(fillerWord:"약간", count: 0),
            FillerWordModel(fillerWord:"아니", count: 0),
            FillerWordModel(fillerWord:"근데", count: 0),
            FillerWordModel(fillerWord:"뭔가", count: 0),
            FillerWordModel(fillerWord:"그러니까", count: 1),
            FillerWordModel(fillerWord:"뭐", count: 3),
            FillerWordModel(fillerWord:"이제", count: 10),
            FillerWordModel(fillerWord:"흠", count: 0),
            FillerWordModel(fillerWord:"그니깐", count: 0),
            FillerWordModel(fillerWord:"그래서", count: 1),
            FillerWordModel(fillerWord:"막", count: 0),
            FillerWordModel(fillerWord:"봐봐", count: 0),
            FillerWordModel(fillerWord:"사실은", count: 0),
            FillerWordModel(fillerWord:"저기", count: 0),
        ],
        fastSentenceIndex: [30, 27, 8, 31],
        slowSentenceIndex: [],
        spmAverage: 396.55622228019826,
        practiceLength: 265.97866666666664,
        fwpm: 4.2860580297166697
    )
    // maxSpm = 566.03773584905662
    // minSpm = 343.2629710001973
    
    var utterance = [
        UtteranceModel(
        startAt: 189810,
        duration: 4560,
        message: "주제 제한은 따로 없으며 팀에서 탐구 해 보고 싶은 주제 라면 무엇이든 계셨습니다."
        ),
        UtteranceModel(
        startAt: 33900,
        duration: 10590,
        message: "그 4 명 혹은 세 명씩 한 팀을 이루게 이루어 총 여덟 팀으로 다니게 될 예정이며 이제 사이클 마다 각 팀별로 주제를 정해 공부한 내용들을 공부할 예정입니다."
        ),
        UtteranceModel(
        startAt: 136530,
        duration: 11190,
        message: "어 그러니까 이제 숙 주 쭈 팀빌딩 이후 각 주차 별로 공유할 팀들 랜덤으로 배정 할 거니까 이제 그 각 팀 들을 본 주차 에 맞춰서 내용은 무엇 고개 신 감사하겠습니다."
        ),
        UtteranceModel(
        startAt: 88380,
        duration: 6779,
        message: "그 앞에서 사이클 마다 각 팀별로 주제를 정해 공부한 내용들을 공유 할 예정이라고 말씀 드렸는데."
        ),
        UtteranceModel(
        startAt: 154200,
        duration: 3329,
        message: "그 중간 중간 개인적으로 공유하고 싶은 내용들이 있으신 분들은."
        ),
        UtteranceModel(
        startAt: 220230,
        duration: 4919,
        message: "그 값 팀에서는 프렌 테이션 과 누가 스플릿 시켜서 공유 자료를 만들어 주면 감사하겠습니다."
        ),
        UtteranceModel(
        startAt: 45870,
        duration: 3929,
        message: "그러면 이제 그 한 사이클 의 한 총 8 개 의 주제가 하고 되겠죠."
        ),
        UtteranceModel(
        startAt: 176400,
        duration: 5639,
        message: "어 그 스터디는 하루 평균 2 시간이며 각 팀들은 3 0 분 의 시간은 피자 맡게 됩니다."
        ),
        UtteranceModel(
        startAt: 183840,
        duration: 5250,
        message: "그 사이클 마다 첫째 주에 제한이 선정 과 관련해서 말씀드리겠습니다."
        ),
        UtteranceModel(
        startAt: 196890,
        duration: 2789,
        message: "뭐 구체적인 예시는 뭐 이런 식으로 될 수 있겠죠."
        ),
        UtteranceModel(
        startAt: 200310,
        duration: 1889,
        message: "뭐 하지만 그 여기 보내지 말고."
        ),
        UtteranceModel(
        startAt: 120210,
        duration: 1620,
        message: "한 사이클 에서."
        ),
        UtteranceModel(
        startAt: 244530,
        duration: 3360,
        message: "본인 일정에 맞게 부담 없게 부담 없이 말씀해 주세요."
        ),
        UtteranceModel(
        startAt: 161250,
        duration: 2850,
        message: "5 분 정도 간단하게 공유 하는 시간을 가져 볼까 합니다."
        ),
        UtteranceModel(
        startAt: 103470,
        duration: 15360,
        message: "제가 저희 스터디는 앞으로 매주 월요일 저녁 6 시에 지금 오리엔테이션 하고 있는 포항 동네 1 8 건물 오층 메일에서 진행 되니 잊지 말고 참석 부탁드리겠습니다 이제 구체적인 한 사이클 일정에 대해 말씀드리도록 하겠습니다."
        ),
        UtteranceModel(
        startAt: 214620,
        duration: 4410,
        message: "1 6 대구 비율의 프렌 션 자료 들과 N 션 으로 텍스트로 모아볼 정 입니다."
        ),
        UtteranceModel(
        startAt: 227549,
        duration: 3900,
        message: "이제 마지막으로 스터디 가입 및 탈퇴에 대해서 설명 드리고 맛 있도록 하겠습니다."
        ),
        UtteranceModel(
        startAt: 6120,
        duration: 1080,
        message: "안녕하세요 여러분."
        ),
        UtteranceModel(
        startAt: 158070,
        duration: 2400,
        message: "각 주차 별로 그 한 명씩 지점 받아서."
        ),
        UtteranceModel(
        startAt: 209520,
        duration: 4469,
        message: "그 9 개월 간의 스터디 가 끝나면 그동안에 결과물을 아카이빙 하려고 합니다."
        ),
        UtteranceModel(
        startAt: 248519,
        duration: 3420,
        message: "그 새로운 사이클 작대기 최소 일주일 전에 말씀해 주시면 감사하겠습니다."
        ),
        UtteranceModel(
        startAt: 56670,
        duration: 9360,
        message: "어 이제 그 스터디 원들의 중국 분야를 초대 본 결과 각각 개발 관련 된 1 9 % 기획 관련 1 5 % 디자인 관련 5 6 % 의 비를 찾아 오고 있었습니다."
        ),
        UtteranceModel(
        startAt: 67470,
        duration: 9509,
        message: "이처럼 이 그 다양한 전문 문화를 가진 사람들이 모인 스터디 이기 때문에 다양한 배경을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 분석 해 볼 수 있습니다."
        ),
        UtteranceModel(
        startAt: 7920,
        duration: 4860,
        message: "아카데미 진행하는 저희 프록시 스터디 디그다 에 참여해 주셔서 감사합니다."
        ),
        UtteranceModel(
        startAt: 96000,
        duration: 5100,
        message: "그 한 달을 한 사이클로 잡고 9 개월 총 아홉 번의 싸이클이 지연 됩니다."
        ),
        UtteranceModel(
        startAt: 13740,
        duration: 7229,
        message: "이제 오늘 오리엔테이션 에서는 디그다 의 방향성에 갔다가 말씀드리고 앞으로 후 결 도 안에 스케줄에 대해서 설명해 드려 가겠습니다."
        ),
        UtteranceModel(
        startAt: 202800,
        duration: 4619,
        message: "팀에서 그 탐구 하고 토론 하면서 공부하고 싶은 주제를 찾아 보는 것 추천 드립니다."
        ),
        UtteranceModel(
        startAt: 165570,
        duration: 8759,
        message: "그 본인의 전공과 관련 내용일 수도 있고 개인적으로 탐구 해 본 내역 일 수 있는 등 개인적으로 서 들과 말하고 싶은 이야기가 있으신 분들은 취하 하겠습니다."
        ),
        UtteranceModel(
        startAt: 50730,
        duration: 3719,
        message: "그 사이클 에 대해서 찬양 설명은 뒤에 다시 들을 하겠습니다."
        ),
        UtteranceModel(
        startAt: 253799,
        duration: 4560,
        message: "아카데미 진행하는 저희 프로젝트 젠 스터디 디그다 에 대한 전반적인 속이 없고 궁금한 점이 있다면 언제든지 저희 연진 에게 편하게 질문 해 주세요 지금까지 들어줘서 감사합니다."
        ),
        UtteranceModel(
        startAt: 122430,
        duration: 12599,
        message: "첫째는 팀별 딩 과 함께 각 팀별로 주제를 선정 하는 시간 이며 어 이제 둘째 주부터 내 주까지는 매주 랜덤으로 세팀 씩 생 끼리 공부한 내용을 정리 하는 네 그래서 공유 하는 시간이 될 예정입니다."
        ),
        UtteranceModel(
        startAt: 232530,
        duration: 11249,
        message: "그 옆 그 앞에서 말씀드렸듯이 그 스터디는 그 한 달에 한 싸이클 씩 총 아홉 사이클 로 이루어져 있고 그 싸이클이 끝날 때마다 스터디 원 들은 자유롭게 합류 하고 떠나는 것이 가능합니다."
        ),
        UtteranceModel(
        startAt: 149100,
        duration: 4439,
        message: "둘째주 에서 일 주 까지는 그 팀 세션 이해해도 개인 준비 돼 있는데요."
        ),
        UtteranceModel(
        startAt: 22800,
        duration: 8669,
        message: "저희가 지난 일주일간 스터디를 몰입 했었는데요 여러분 여러분들의 열렬한 관심 덕분에 제 40 명이 모이게 되었습니다."
        ),
        UtteranceModel(
        startAt: 80970,
        duration: 6689,
        message: "이미 여러분들이 알고 계신 대로 1 2 월 사 일과 5 일에 걸쳐서 는 오리엔테이션 이 진행 됩니다."
        ),
        UtteranceModel(
        startAt: 78480,
        duration: 1890,
        message: "이제 일정을 공유 해 드리도록 하겠습니다."
        )
    ]
    var words = [
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 551,
        word: "감사하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 518,
        word: "이루어져 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 33,
        word: "일주일간 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 17,
        word: "의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 519,
        word: "있고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 149,
        word: "주제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 150,
        word: "바라 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 214,
        word: "매주 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 267,
        word: "세팀 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 322,
        word: "개인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 332,
        word: "내용들이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 514,
        word: "총 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 543,
        word: "새로운 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 151,
        word: "보고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 42,
        word: "제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 440,
        word: "공부하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 181,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 454,
        word: "끝나면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 255,
        word: "선정 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 244,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 31,
        word: "저희가 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 374,
        word: "이야기가 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 101,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 128,
        word: "오고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 104,
        word: "분야를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 203,
        word: "개월 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 95,
        word: "다시 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 219,
        word: "지금 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 6,
        index: 99,
        word: "이제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 69,
        word: "정해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 9,
        word: "참여해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 460,
        word: "1 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 243,
        word: "하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 160,
        word: "해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 52,
        word: "명씩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 163,
        word: "이미 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 458,
        word: "하려고 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 13,
        index: 276,
        word: "그래서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 231,
        word: "되니 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 147,
        word: "다른 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 275,
        word: "네 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 113,
        word: "9 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 53,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 375,
        word: "있으신 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 444,
        word: "보는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 237,
        word: "구체적인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 365,
        word: "일 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 60,
        word: "다니게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 506,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 224,
        word: "동네 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 229,
        word: "메일에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 16,
        word: "디그다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 347,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 38,
        word: "여러분들의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 525,
        word: "원 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 240,
        word: "일정에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 469,
        word: "션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 390,
        word: "분 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 484,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 321,
        word: "이해해도 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 26,
        word: "스케줄에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 100,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 37,
        word: "여러분 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 135,
        word: "문화를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 133,
        word: "다양한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 173,
        word: "5 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 481,
        word: "누가 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 431,
        word: "여기 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 297,
        word: "할 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 5,
        word: "프록시 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 511,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 329,
        word: "개인적으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 11,
        word: "감사합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 526,
        word: "들은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 278,
        word: "하는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 421,
        word: "예시는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 550,
        word: "주시면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 294,
        word: "팀들 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 494,
        word: "탈퇴에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 92,
        word: "찬양 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 188,
        word: "정해 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 23,
        index: 428,
        word: "뭐 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 352,
        word: "합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 473,
        word: "정 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 230,
        word: "진행 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 318,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 161,
        word: "드리도록 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 303,
        word: "들을 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 12,
        index: 236,
        word: "이제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 447,
        word: "드립니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 204,
        word: "총 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 314,
        word: "에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 158,
        word: "일정을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 114,
        word: "% "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 44,
        word: "명이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 531,
        word: "것이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 252,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 351,
        word: "볼까 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 300,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 209,
        word: "됩니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 453,
        word: "가 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 482,
        word: "스플릿 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 468,
        word: "N "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 335,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 200,
        word: "사이클로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 129,
        word: "있었습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 80,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 46,
        word: "되었습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 239,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 13,
        word: "오늘 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 495,
        word: "대해서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 91,
        word: "대해서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 185,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 554,
        word: "저희 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 152,
        word: "분석 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 24,
        word: "도 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 43,
        word: "40 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 372,
        word: "말하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 61,
        word: "될 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 385,
        word: "시간이며 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 172,
        word: "일과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 184,
        word: "마다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 312,
        word: "감사하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 155,
        word: "수 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 349,
        word: "시간을 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 14,
        index: 283,
        word: "그러니까 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 226,
        word: "8 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 452,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 360,
        word: "개인적으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 549,
        word: "말씀해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 313,
        word: "둘째주 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 14,
        index: 284,
        word: "이제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 470,
        word: "으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 442,
        word: "주제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 568,
        word: "저희 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 570,
        word: "에게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 271,
        word: "공부한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 366,
        word: "수 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 369,
        word: "개인적으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 328,
        word: "중간 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 168,
        word: "1 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 234,
        word: "참석 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 557,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 434,
        word: "팀에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 561,
        word: "전반적인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 567,
        word: "언제든지 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 145,
        word: "사람들과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 304,
        word: "본 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 78,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 256,
        word: "하는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 521,
        word: "싸이클이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 393,
        word: "피자 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 112,
        word: "1 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 373,
        word: "싶은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 400,
        word: "주에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 413,
        word: "보고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 249,
        word: "딩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 563,
        word: "없고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 457,
        word: "아카이빙 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 159,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 389,
        word: "0 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 210,
        word: "제가 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 435,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 198,
        word: "달을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 124,
        word: "% "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 420,
        word: "구체적인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 81,
        word: "총 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 90,
        word: "에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 480,
        word: "과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 547,
        word: "일주일 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 54,
        word: "팀을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 407,
        word: "제한은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 253,
        word: "팀별로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 23,
        word: "결 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 358,
        word: "수도 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 441,
        word: "싶은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 474,
        word: "입니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 257,
        word: "시간 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 537,
        word: "없게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 520,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 115,
        word: "기획 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 386,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 334,
        word: "분들은."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 538,
        word: "부담 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 143,
        word: "배경을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 515,
        word: "아홉 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 132,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 325,
        word: "있는데요."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 268,
        word: "씩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 476,
        word: "값 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 341,
        word: "지점 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 405,
        word: "말씀드리겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 553,
        word: "진행하는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 140,
        word: "이기 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 108,
        word: "각각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 381,
        word: "스터디는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 451,
        word: "간의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 361,
        word: "탐구 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 560,
        word: "대한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 217,
        word: "6 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 331,
        word: "싶은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 508,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 177,
        word: "오리엔테이션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 19,
        word: "갔다가 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 290,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 445,
        word: "것 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 241,
        word: "대해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 58,
        word: "여덟 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 154,
        word: "볼 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 338,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 499,
        word: "있도록 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 263,
        word: "내 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 532,
        word: "가능합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 67,
        word: "팀별로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 524,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 463,
        word: "비율의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 308,
        word: "내용은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 189,
        word: "공부한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 102,
        word: "원들의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 323,
        word: "준비 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 27,
        index: 489,
        word: "이제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 345,
        word: "정도 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 18,
        word: "방향성에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 144,
        word: "가진 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 486,
        word: "만들어 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 258,
        word: "이며 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 1,
        index: 12,
        word: "이제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 433,
        word: "말고. "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 516,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 384,
        word: "2 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 388,
        word: "3 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 72,
        word: "공부할 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 221,
        word: "하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 465,
        word: "션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 110,
        word: "관련 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 362,
        word: "해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 378,
        word: "하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 82,
        word: "8 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 478,
        word: "프렌 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 83,
        word: "개 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 148,
        word: "관점에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 265,
        word: "매주 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 552,
        word: "아카데미 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 202,
        word: "9 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 356,
        word: "관련 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 87,
        word: "되겠죠."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 85,
        word: "주제가 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 443,
        word: "찾아 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 13,
        index: 260,
        word: "이제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 383,
        word: "평균 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 333,
        word: "있으신 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 68,
        word: "주제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 1,
        word: "여러분. "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 566,
        word: "있다면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 182,
        word: "앞에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 127,
        word: "찾아 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 125,
        word: "의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 272,
        word: "내용을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 117,
        word: "1 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 399,
        word: "첫째 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 14,
        index: 299,
        word: "이제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 496,
        word: "설명 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 175,
        word: "걸쳐서 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 8,
        index: 157,
        word: "이제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 450,
        word: "개월 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 29,
        word: "드려 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 395,
        word: "됩니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 183,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 353,
        word: "그 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 4,
        index: 75,
        word: "이제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 377,
        word: "취하 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 305,
        word: "주차 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 76,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 205,
        word: "아홉 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 246,
        word: "에서. "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 436,
        word: "탐구 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 55,
        word: "이루게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 286,
        word: "주 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 59,
        word: "팀으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 164,
        word: "여러분들이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 247,
        word: "첫째는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 97,
        word: "하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 479,
        word: "테이션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 342,
        word: "받아서. "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 142,
        word: "다양한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 96,
        word: "들을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 118,
        word: "5 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 487,
        word: "주면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 527,
        word: "자유롭게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 199,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 153,
        word: "해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 387,
        word: "팀들은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 500,
        word: "하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 320,
        word: "세션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 235,
        word: "부탁드리겠습니다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 238,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 139,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 317,
        word: "까지는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 22,
        word: "후 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 274,
        word: "하는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 270,
        word: "끼리 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 292,
        word: "별로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 41,
        word: "덕분에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 254,
        word: "주제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 402,
        word: "선정 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 301,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 279,
        word: "시간이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 411,
        word: "탐구 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 545,
        word: "작대기 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 176,
        word: "는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 409,
        word: "없으며 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 171,
        word: "사 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 577,
        word: "감사합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 280,
        word: "될 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 295,
        word: "랜덤으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 423,
        word: "이런 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 56,
        word: "이루어 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 564,
        word: "궁금한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 359,
        word: "있고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 504,
        word: "앞에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 346,
        word: "간단하게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 178,
        word: "이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 79,
        word: "의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 47,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 456,
        word: "결과물을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 339,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 34,
        word: "스터디를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 57,
        word: "총 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 19,
        index: 379,
        word: "어 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 0,
        word: "안녕하세요 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 424,
        word: "식으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 485,
        word: "자료를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 196,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 355,
        word: "전공과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 327,
        word: "중간 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 27,
        word: "대해서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 403,
        word: "과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 195,
        word: "드렸는데."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 498,
        word: "맛 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 216,
        word: "저녁 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 273,
        word: "정리 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 306,
        word: "에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 269,
        word: "생 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 7,
        word: "디그다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 137,
        word: "사람들이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 141,
        word: "때문에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 93,
        word: "설명은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 302,
        word: "팀 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 223,
        word: "포항 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 522,
        word: "끝날 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 391,
        word: "의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 64,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 20,
        word: "말씀드리고 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 22,
        index: 422,
        word: "뭐 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 461,
        word: "6 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 408,
        word: "따로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 15,
        word: "에서는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 208,
        word: "지연 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 425,
        word: "될 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 4,
        word: "저희 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 170,
        word: "월 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 192,
        word: "할 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 336,
        word: "주차 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 215,
        word: "월요일 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 427,
        word: "있겠죠."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 429,
        word: "하지만 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 156,
        word: "있습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 488,
        word: "감사하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 296,
        word: "배정 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 179,
        word: "진행 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 492,
        word: "가입 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 534,
        word: "일정에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 414,
        word: "싶은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 326,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 166,
        word: "계신 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 6,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 536,
        word: "부담 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 14,
        index: 282,
        word: "어 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 370,
        word: "서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 165,
        word: "알고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 120,
        word: "디자인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 285,
        word: "숙 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 344,
        word: "분 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 289,
        word: "이후 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 417,
        word: "무엇이든 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 368,
        word: "등 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 394,
        word: "맡게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 288,
        word: "팀빌딩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 529,
        word: "하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 559,
        word: "에 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 13,
        index: 259,
        word: "어 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 572,
        word: "질문 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 187,
        word: "주제를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 123,
        word: "6 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 467,
        word: "들과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 382,
        word: "하루 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 32,
        word: "지난 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 477,
        word: "팀에서는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 169,
        word: "2 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 6,
        index: 98,
        word: "어 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 464,
        word: "프렌 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 502,
        word: "옆 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 412,
        word: "해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 337,
        word: "별로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 213,
        word: "앞으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 509,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 376,
        word: "분들은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 28,
        word: "설명해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 364,
        word: "내역 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 232,
        word: "잊지 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 103,
        word: "중국 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 94,
        word: "뒤에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 503,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 350,
        word: "가져 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 207,
        word: "싸이클이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 248,
        word: "팀별 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 48,
        word: "4 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 340,
        word: "명씩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 548,
        word: "전에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 307,
        word: "맞춰서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 311,
        word: "신 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 167,
        word: "대로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 21,
        word: "앞으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 556,
        word: "젠 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 287,
        word: "쭈 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 401,
        word: "제한이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 380,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 398,
        word: "마다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 50,
        word: "혹은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 206,
        word: "번의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 45,
        word: "모이게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 483,
        word: "시켜서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 193,
        word: "예정이라고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 293,
        word: "공유할 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 363,
        word: "본 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 74,
        word: "그러면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 319,
        word: "팀 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 309,
        word: "무엇 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 406,
        word: "주제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 121,
        word: "관련 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 298,
        word: "거니까 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 343,
        word: "5 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 266,
        word: "랜덤으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 2,
        word: "아카데미 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 264,
        word: "주까지는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 446,
        word: "추천 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 555,
        word: "프로젝트 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 396,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 533,
        word: "본인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 574,
        word: "주세요 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 513,
        word: "씩 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 71,
        word: "내용들을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 523,
        word: "때마다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 404,
        word: "관련해서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 448,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 565,
        word: "점이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 39,
        word: "열렬한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 197,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 491,
        word: "스터디 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 562,
        word: "속이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 539,
        word: "없이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 174,
        word: "일에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 70,
        word: "공부한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 51,
        word: "세 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 105,
        word: "초대 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 88,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 251,
        word: "함께 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 130,
        word: "이처럼 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 512,
        word: "싸이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 19,
        index: 392,
        word: "시간은 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 77,
        word: "한 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 194,
        word: "말씀 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 66,
        word: "각 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 354,
        word: "본인의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 517,
        word: "로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 310,
        word: "고개 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 186,
        word: "팀별로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 462,
        word: "대구 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 449,
        word: "9 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 575,
        word: "지금까지 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 8,
        word: "에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 26,
        index: 475,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 281,
        word: "예정입니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 35,
        word: "몰입 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 542,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 455,
        word: "그동안에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 261,
        word: "둘째 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 233,
        word: "말고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 49,
        word: "명 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 9,
        index: 180,
        word: "됩니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 471,
        word: "텍스트로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 245,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 466,
        word: "자료 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 277,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 544,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 14,
        word: "오리엔테이션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 138,
        word: "모인 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 416,
        word: "라면 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 106,
        word: "본 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 530,
        word: "떠나는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 16,
        index: 330,
        word: "공유하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 3,
        word: "진행하는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 541,
        word: "주세요."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 25,
        word: "안에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 24,
        index: 459,
        word: "합니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 218,
        word: "시에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 371,
        word: "들과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 250,
        word: "과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 573,
        word: "해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 535,
        word: "맞게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 36,
        word: "했었는데요 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 220,
        word: "오리엔테이션 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 501,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 84,
        word: "의 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 357,
        word: "내용일 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 62,
        word: "예정이며 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 432,
        word: "보내지 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 22,
        index: 426,
        word: "수 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 439,
        word: "하면서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 510,
        word: "달에 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 5,
        index: 89,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 126,
        word: "비를 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 17,
        index: 348,
        word: "하는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 212,
        word: "스터디는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 211,
        word: "저희 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 4,
        index: 86,
        word: "하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 418,
        word: "계셨습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 569,
        word: "연진 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 8,
        index: 162,
        word: "하겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 11,
        index: 201,
        word: "잡고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 122,
        word: "5 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 25,
        index: 472,
        word: "모아볼 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 316,
        word: "주 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 30,
        index: 546,
        word: "최소 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 505,
        word: "말씀드렸듯이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 324,
        word: "돼 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 190,
        word: "내용들을 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 20,
        index: 397,
        word: "사이클 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 136,
        word: "가진 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 65,
        word: "마다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 227,
        word: "건물 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 430,
        word: "그 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 571,
        word: "편하게 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 242,
        word: "말씀드리도록 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 2,
        index: 40,
        word: "관심 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 497,
        word: "드리고 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 3,
        index: 63,
        word: "이제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 131,
        word: "이 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 13,
        index: 262,
        word: "주부터 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 490,
        word: "마지막으로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 438,
        word: "토론 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 558,
        word: "디그다 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 0,
        index: 10,
        word: "주셔서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 3,
        index: 73,
        word: "예정입니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 119,
        word: "% "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 228,
        word: "오층 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 29,
        index: 540,
        word: "말씀해 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 528,
        word: "합류 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 225,
        word: "1 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 107,
        word: "결과 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 14,
        index: 291,
        word: "주차 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 28,
        index: 507,
        word: "스터디는 "
        ),
        WordModel(
        isFillerWord: true,
        sentenceIndex: 22,
        index: 419,
        word: "뭐 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 27,
        index: 493,
        word: "및 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 15,
        index: 315,
        word: "일 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 146,
        word: "서로 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 1,
        index: 30,
        word: "가겠습니다."
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 111,
        word: "된 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 23,
        index: 437,
        word: "하고 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 18,
        index: 367,
        word: "있는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 109,
        word: "개발 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 12,
        index: 222,
        word: "있는 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 415,
        word: "주제 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 7,
        index: 134,
        word: "전문 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 31,
        index: 576,
        word: "들어줘서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 10,
        index: 191,
        word: "공유 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 21,
        index: 410,
        word: "팀에서 "
        ),
        WordModel(
        isFillerWord: false,
        sentenceIndex: 6,
        index: 116,
        word: "관련 ")
    ]
    var sentences = [
        SentenceModel(
        index: 24,
        sentence: "그 9 개월 간의 스터디 가 끝나면 그동안에 결과물을 아카이빙 하려고 합니다.",
        startAt: 209520,
        endAt: 213989,
        spmValue: 416.20049228015216
        ),
        SentenceModel(
        index: 13,
        sentence: "한 사이클 에서. 첫째는 팀별 딩 과 함께 각 팀별로 주제를 선정 하는 시간 이며 어 이제 둘째 주부터 내 주까지는 매주 랜덤으로 세팀 씩 생 끼리 공부한 내용을 정리 하는 네 그래서 공유 하는 시간이 될 예정입니다.",
        startAt: 120210,
        endAt: 135029,
        spmValue: 346.0158942260356
        ),
        SentenceModel(
        index: 22,
        sentence: "뭐 구체적인 예시는 뭐 이런 식으로 될 수 있겠죠.",
        startAt: 196890,
        endAt: 199679,
        spmValue: 408.7486554320545
        ),
        SentenceModel(
        index: 23,
        sentence: "뭐 하지만 그 여기 보내지 말고. 팀에서 그 탐구 하고 토론 하면서 공부하고 싶은 주제를 찾아 보는 것 추천 드립니다.",
        startAt: 200310,
        endAt: 207419,
        spmValue: 414.8740012292563
        ),
        SentenceModel(
        index: 1,
        sentence: "이제 오늘 오리엔테이션 에서는 디그다 의 방향성에 갔다가 말씀드리고 앞으로 후 결 도 안에 스케줄에 대해서 설명해 드려 가겠습니다.",
        startAt: 13740,
        endAt: 20969,
        spmValue: 448.1947710610043
        ),
        SentenceModel(
        index: 31,
        sentence: "아카데미 진행하는 저희 프로젝트 젠 스터디 디그다 에 대한 전반적인 속이 없고 궁금한 점이 있다면 언제든지 저희 연진 에게 편하게 질문 해 주세요 지금까지 들어줘서 감사합니다.",
        startAt: 253799,
        endAt: 258359,
        spmValue: 947.3684210526316
        ),
        SentenceModel(
        index: 0,
        sentence: "안녕하세요 여러분. 아카데미 진행하는 저희 프록시 스터디 디그다 에 참여해 주셔서 감사합니다.",
        startAt: 6120,
        endAt: 12780,
        spmValue: 393.93939393939394
        ),
        SentenceModel(
        index: 29,
        sentence: "본인 일정에 맞게 부담 없게 부담 없이 말씀해 주세요.",
        startAt: 244530,
        endAt: 247890,
        spmValue: 375.0
        ),
        SentenceModel(
        index: 8,
        sentence: "이제 일정을 공유 해 드리도록 하겠습니다.",
        startAt: 78480,
        endAt: 80370,
        spmValue: 539.6825396825396
        ),
        SentenceModel(
        index: 11,
        sentence: "그 한 달을 한 사이클로 잡고 9 개월 총 아홉 번의 싸이클이 지연 됩니다.",
        startAt: 96000,
        endAt: 101100,
        spmValue: 329.4117647058824
        ),
        SentenceModel(
        index: 3,
        sentence: "그 4 명 혹은 세 명씩 한 팀을 이루게 이루어 총 여덟 팀으로 다니게 될 예정이며 이제 사이클 마다 각 팀별로 주제를 정해 공부한 내용들을 공부할 예정입니다.",
        startAt: 33900,
        endAt: 44490,
        spmValue: 351.2747875354108
        ),
        SentenceModel(
        index: 20,
        sentence: "그 사이클 마다 첫째 주에 제한이 선정 과 관련해서 말씀드리겠습니다.",
        startAt: 183840,
        endAt: 189090,
        spmValue: 320.0
        ),
        SentenceModel(
        index: 19,
        sentence: "어 그 스터디는 하루 평균 2 시간이며 각 팀들은 3 0 분 의 시간은 피자 맡게 됩니다.",
        startAt: 176400,
        endAt: 182039,
        spmValue: 351.1260861854939
        ),
        SentenceModel(
        index: 18,
        sentence: "그 본인의 전공과 관련 내용일 수도 있고 개인적으로 탐구 해 본 내역 일 수 있는 등 개인적으로 서 들과 말하고 싶은 이야기가 있으신 분들은 취하 하겠습니다.",
        startAt: 165570,
        endAt: 174329,
        spmValue: 424.7060166685695
        ),
        SentenceModel(
        index: 14,
        sentence: "어 그러니까 이제 숙 주 쭈 팀빌딩 이후 각 주차 별로 공유할 팀들 랜덤으로 배정 할 거니까 이제 그 각 팀 들을 본 주차 에 맞춰서 내용은 무엇 고개 신 감사하겠습니다.",
        startAt: 136530,
        endAt: 147720,
        spmValue: 343.16353887399464
        ),
        SentenceModel(
        index: 15,
        sentence: "둘째주 에서 일 주 까지는 그 팀 세션 이해해도 개인 준비 돼 있는데요.",
        startAt: 149100,
        endAt: 153539,
        spmValue: 364.9470601486821
        ),
        SentenceModel(
        index: 7,
        sentence: "이처럼 이 그 다양한 전문 문화를 가진 사람들이 모인 스터디 이기 때문에 다양한 배경을 가진 사람들과 서로 다른 관점에서 주제를 바라 보고 분석 해 볼 수 있습니다.",
        startAt: 67470,
        endAt: 76979,
        spmValue: 410.13776422336736
        ),
        SentenceModel(
        index: 17,
        sentence: "각 주차 별로 그 한 명씩 지점 받아서. 5 분 정도 간단하게 공유 하는 시간을 가져 볼까 합니다.",
        startAt: 158070,
        endAt: 164100,
        spmValue: 411.42857142857144
        ),
        SentenceModel(
        index: 26,
        sentence: "그 값 팀에서는 프렌 테이션 과 누가 스플릿 시켜서 공유 자료를 만들어 주면 감사하겠습니다.",
        startAt: 220230,
        endAt: 225149,
        spmValue: 451.3112421223826
        ),
        SentenceModel(
        index: 6,
        sentence: "어 이제 그 스터디 원들의 중국 분야를 초대 본 결과 각각 개발 관련 된 1 9 % 기획 관련 1 5 % 디자인 관련 5 6 % 의 비를 찾아 오고 있었습니다.",
        startAt: 56670,
        endAt: 66030,
        spmValue: 365.38461538461536
        ),
        SentenceModel(
        index: 9,
        sentence: "이미 여러분들이 알고 계신 대로 1 2 월 사 일과 5 일에 걸쳐서 는 오리엔테이션 이 진행 됩니다.",
        startAt: 80970,
        endAt: 87659,
        spmValue: 340.85812528031096
        ),
        SentenceModel(
        index: 4,
        sentence: "그러면 이제 그 한 사이클 의 한 총 8 개 의 주제가 하고 되겠죠.",
        startAt: 45870,
        endAt: 49799,
        spmValue: 366.5054721303131
        ),
        SentenceModel(
        index: 10,
        sentence: "그 앞에서 사이클 마다 각 팀별로 주제를 정해 공부한 내용들을 공유 할 예정이라고 말씀 드렸는데.",
        startAt: 88380,
        endAt: 95159,
        spmValue: 345.1836554064021
        ),
        SentenceModel(
        index: 30,
        sentence: "그 새로운 사이클 작대기 최소 일주일 전에 말씀해 주시면 감사하겠습니다.",
        startAt: 248519,
        endAt: 251939,
        spmValue: 526.3157894736842
        ),
        SentenceModel(
        index: 16,
        sentence: "그 중간 중간 개인적으로 공유하고 싶은 내용들이 있으신 분들은.",
        startAt: 154200,
        endAt: 157529,
        spmValue: 468.6091919495344
        ),
        SentenceModel(
        index: 21,
        sentence: "주제 제한은 따로 없으며 팀에서 탐구 해 보고 싶은 주제 라면 무엇이든 계셨습니다.",
        startAt: 189810,
        endAt: 194370,
        spmValue: 434.2105263157895
        ),
        SentenceModel(
        index: 12,
        sentence: "제가 저희 스터디는 앞으로 매주 월요일 저녁 6 시에 지금 오리엔테이션 하고 있는 포항 동네 1 8 건물 오층 메일에서 진행 되니 잊지 말고 참석 부탁드리겠습니다 이제 구체적인 한 사이클 일정에 대해 말씀드리도록 하겠습니다.",
        startAt: 103470,
        endAt: 118830,
        spmValue: 355.46875
        ),
        SentenceModel(
        index: 5,
        sentence: "그 사이클 에 대해서 찬양 설명은 뒤에 다시 들을 하겠습니다.",
        startAt: 50730,
        endAt: 54449,
        spmValue: 387.20086044635656
        ),
        SentenceModel(
        index: 2,
        sentence: "저희가 지난 일주일간 스터디를 몰입 했었는데요 여러분 여러분들의 열렬한 관심 덕분에 제 40 명이 모이게 되었습니다.",
        startAt: 22800,
        endAt: 31469,
        spmValue: 339.13946245241664
        ),
        SentenceModel(
        index: 25,
        sentence: "1 6 대구 비율의 프렌 션 자료 들과 N 션 으로 텍스트로 모아볼 정 입니다.",
        startAt: 214620,
        endAt: 219030,
        spmValue: 394.5578231292517
        ),
        SentenceModel(
        index: 28,
        sentence: "그 옆 그 앞에서 말씀드렸듯이 그 스터디는 그 한 달에 한 싸이클 씩 총 아홉 사이클 로 이루어져 있고 그 싸이클이 끝날 때마다 스터디 원 들은 자유롭게 합류 하고 떠나는 것이 가능합니다.",
        startAt: 232530,
        endAt: 243779,
        spmValue: 389.3679438172282
        ),
        SentenceModel(
        index: 27,
        sentence: "이제 마지막으로 스터디 가입 및 탈퇴에 대해서 설명 드리고 맛 있도록 하겠습니다.",
        startAt: 227549,
        endAt: 231449,
        spmValue: 507.6923076923077
        )
    ]
}

// swiftlint: enable type_body_length file_length
