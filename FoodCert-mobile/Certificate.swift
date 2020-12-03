//
//  Certificate.swift
//  FoodCert-mobile
//
//  Created by Denis on 12/3/20.
//

import SwiftUI

struct Certificate: View {
    var certificateURL: String
    @State var savedURL: URL?
    @State var fileLoaded: Bool = false
    
    func fetch() {
        let downloadTask = URLSession.shared.downloadTask(with: URL(string: certificateURL)!) {
            urlOrNil, responseOrNil, errorOrNil in
            
            guard let fileURL = urlOrNil else { return }
            do {
                let documentsURL = try
                    FileManager.default.url(for: .documentDirectory,
                                            in: .userDomainMask,
                                            appropriateFor: nil,
                                            create: false)
                let savedURL = documentsURL.appendingPathComponent(fileURL.lastPathComponent)
                try FileManager.default.moveItem(at: fileURL, to: savedURL)
                self.savedURL = savedURL
                self.fileLoaded = true;
            } catch {
                print ("file error: \(error)")
            }
        }
        downloadTask.resume()
    }
    
    var body: some View {
        VStack {
            if fileLoaded {
                PDFKitView(url: self.savedURL!)
            }
        }.onAppear(perform: {
            fetch()
        })
    }
}

struct Certificate_Previews: PreviewProvider {
    static var previews: some View {
        Certificate(certificateURL: "http://localhost:3333/certificate/5fb65e4f9a1aec48ac5707fd?authToken=7b920013-1c0c-44f1-8c12-c55e01d85dd3")
    }
}
