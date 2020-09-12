//
//  ViewController.swift
//  Serif
//
//  Created by 安田 悠麿 on 2020/09/11.
//  Copyright © 2020 安田 悠麿. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
var selif = Selif()
  var speechSynthesizer : AVSpeechSynthesizer!
  @IBOutlet weak var first: UIButton!
  

  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    first.setTitle(selif.word, for: .normal)
    
    
  }
  @IBAction func button(_ sender: Any) {
    self.speechSynthesizer = AVSpeechSynthesizer()
     let utterance = AVSpeechUtterance(string: selif.word!)// 読み上げる文字
    utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
    utterance.rate = 0.5;  //読み上げ速度
    utterance.pitchMultiplier = 0.5; //声のピッチ
     utterance.preUtteranceDelay = 0.2;//読み上げるまでのため
    
    self.speechSynthesizer.speak(utterance)
  }
  
  @IBAction func reset(_ sender: Any) {
    self.selif = Selif()
    first.setTitle(selif.word, for: .normal)
    
  }
  
}


class Selif{
  var word:String? = nil
  init() {
    let list: [String] = ["はもん", "みちが", "きょうは"]
    let element = list.randomElement()
    self.word = element!
  }
}


