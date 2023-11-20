//
//  Url+Extension.swift
//  highpitch
//
//  Created by musung on 11/15/23.
//

import Foundation

enum URLType {
    case audio
    case video
}
extension URL {
    static func getPath(fileName: String, type: URLType) -> URL {
        var folderName: String
        var fileExtension : String
        switch type {
        case .audio :
            folderName = "Audio"
            fileExtension = ".m4a"
        case .video :
            folderName = "Video"
            fileExtension = ".mp4"
        }
        
        let dataPath = getApplicationDirectory()
            .appendingPathComponent("HighPitch")
            .appendingPathComponent(folderName)
        do {
            try FileManager.default
                .createDirectory(at: dataPath, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("Error creating directory: \(error.localizedDescription)")
        }
        return dataPath.appendingPathComponent(fileName + fileExtension)
    }
    private static func getDownloadsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .downloadsDirectory, in: .userDomainMask)
        return paths[0]
    }
    private static func getApplicationDirectory() -> URL {
        let paths = FileManager.default.urls(for: .applicationDirectory, in: .userDomainMask)
        return paths[0]
    }
    private static func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    private static func getLibrariesDirectory() -> URL {
        let paths = FileManager.default.urls(for: .allLibrariesDirectory, in: .userDomainMask)
        return paths[0]
    }
}
