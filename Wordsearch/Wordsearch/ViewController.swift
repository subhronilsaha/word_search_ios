//
//  ViewController.swift
//  Wordsearch
//
//  Created by Subhronil Saha on 13/09/20.
//  Copyright © 2020 Subhronil Saha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let path = Bundle.main.url(forResource: "capitals", withExtension: "json")!
        let contents = try! Data(contentsOf: path)
        let words = try! JSONDecoder().decode([Word].self, from: contents)
        
        let wordSearch = WordSearch()
        wordSearch.words = words
        wordSearch.makeGrid()
        let output = wordSearch.render()
        let url = getDocumentsDirectory().appendingPathComponent("output.pdf")
        print(url)
        try? output.write(to: url)
    }

    func getDocumentsDirectory() -> URL{
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

