//
//  CacheManager.swift
//  MGAPIService
//
//  Created by Tuan Truong on 4/5/19.
//  Copyright © 2019 Sun Asterisk. All rights reserved.
//

import Foundation

public enum CacheManagerError: Error {
    case invalidFileName(urlString: String)
    case invalidFileData
}

open class CacheManager {
    public static var sharedInstance = CacheManager()
    
    public let fileExtension = "cache"
    
    public func fileURL(fileName: String) -> URL? {
        return try? FileManager.default
            .url(for: .cachesDirectory,
                 in: .userDomainMask,
                 appropriateFor: nil,
                 create: false)
            .appendingPathComponent(fileName)
            .appendingPathExtension(fileExtension)
    }
    
    public func encodedFileName(urlString: String) -> String? {
        return urlString
            .toBase64()
            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    }
    
    public func read(urlString: String) throws -> Any {
        if let fileName = self.encodedFileName(urlString: urlString),
            let url = self.fileURL(fileName: fileName) {
            if let data = try? Data(contentsOf: url),
                let dictionary = NSKeyedUnarchiver.unarchiveObject(with: data) {
                return dictionary
            } else {
                throw CacheManagerError.invalidFileData
            }
        } else {
            throw CacheManagerError.invalidFileName(urlString: urlString)
        }
    }
    
    public func write(urlString: String, data: Any) throws {
        guard let fileName = self.encodedFileName(urlString: urlString),
            let fileURL = self.fileURL(fileName: fileName) else {
                throw CacheManagerError.invalidFileName(urlString: urlString)
        }
        let data = NSKeyedArchiver.archivedData(withRootObject: data)
        try data.write(to: fileURL, options: .atomic)
    }
    
    public func clear() {
        let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        guard let folderPath = paths.first else { return }
        let fileManager = FileManager.default
        let enumerator = fileManager.enumerator(atPath: folderPath)
        while let element = enumerator?.nextObject() as? String {
            let url = URL(fileURLWithPath: folderPath).appendingPathComponent(element)
            if url.pathExtension == fileExtension {
                try? fileManager.removeItem(at: url)
            }
        }
    }
    
    public func removeCache(for urlString: String) {
        guard let fileName = self.encodedFileName(urlString: urlString),
            let fileURL = self.fileURL(fileName: fileName) else {
                return
        }
        let fileManager = FileManager.default
        try? fileManager.removeItem(at: fileURL)
    }
}
