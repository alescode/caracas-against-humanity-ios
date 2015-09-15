//
//  ViewController.swift
//  CaracasAgainstHumanity
//
//  Created by Alejandro on 9/15/15.
//  Copyright (c) 2015 magia. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    let QuestionUrl = NSURL(string: "http://www.caracasagainsthumanity.com/api/question")!
    let AnswerUrl = NSURL(string: "http://www.caracasagainsthumanity.com/api/answer")!
    
    func fetchNew(url: NSURL) {
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) {(data, response, error) in
            if let question = NSString(data: data, encoding: NSUTF8StringEncoding) {
                dispatch_async(dispatch_get_main_queue(), {
                    self.textView.text = question as String
                })
            }
        }
        task.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.textView.backgroundColor = UIColor.clearColor()
        fetchNew(QuestionUrl)
    }

    @IBAction func newQuestion(sender: UIButton) {
        self.view.backgroundColor = UIColor.whiteColor()
        self.textView.textColor = UIColor.blackColor()
        fetchNew(QuestionUrl)
    }
    
    @IBAction func newAnswer(sender: UIButton) {
        self.view.backgroundColor = UIColor.blackColor()
        self.textView.textColor = UIColor.whiteColor()
        fetchNew(AnswerUrl)
    }


}

