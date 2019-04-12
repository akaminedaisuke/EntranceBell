//
//  ViewController.swift
//  EntranceBell
//
//  Created by USER on 2019/01/27.
//  Copyright © 2019 USER. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var CoLogo: UIImageView!
    @IBOutlet var mainMessage: UILabel!
    @IBOutlet var button: UIButton!
    var lineBreakMode:NSLineBreakMode!
    var audioPlayer : AVAudioPlayer!

    let userDefaults = UserDefaults.standard
    
    let TCVC = TimeChooseViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Do any additional setup after loading the view, typically from a nib.
        //メッセージ初期値
        userDefaults.register(defaults:["corporateName":"[社名]"])
        //初期メッセージ
        mainMessage.text = "ご来社ありがとうございます。ようこそ" + userDefaults.string(forKey: "corporateName")! + "へ！\nご用の方は下のボタンにタッチして下さい。"
        //ボタンの設定
        let rgba =  UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        button.backgroundColor = rgba
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 50.0
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        //音声を再生するための設定
        let soundFilePath = Bundle.main.path(forResource: "info-lady1_info-lady1-shibarakuomachi1",ofType:"mp3")!
        let sound:URL = URL(fileURLWithPath: soundFilePath)
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: sound , fileTypeHint:nil)
        }catch{
            print("AVAudioPlayerインスタンスでエラー")
        }
        audioPlayer.prepareToPlay()
    }
    //呼び出し（Touchボタン）のアクション
    @IBAction func Touch(_ sender: Any) {
        audioPlayer.currentTime = 0
        audioPlayer.play()
        mainMessage.text = "担当者が参ります 暫くお待ち下さい"
        //Touchボタン押下後、一定時間で元のメッセージへ戻す処理
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(TCVC.chooseItem[userDefaults.integer(forKey: "indexNo")]))
        {
            self.mainMessage.text = "ご来社ありがとうございます。ようこそ" + self.userDefaults.string(forKey: "corporateName")! + "へ！\nご用の方は下のボタンにタッチして下さい。"
        }
    }
    
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning()
    }
}
