//
//  ViewController.swift
//  Xylophone
//
//  Created by Yasin Cetin on 2.09.2023.
//

import UIKit
import AVFoundation

final class ViewController: UIViewController {
    
    
    private var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func keyTapped(_ sender: UIButton) {
        if let buttonName = sender.titleLabel?.text {
            do{
                try playAudio(name: buttonName)
            } catch {
                print("error")
            }
        }
        
        sender.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            sender.alpha = 1.0
        }
    }
    
    
    func playAudio(name:String) throws {
        
        if let url = Bundle.main.url(forResource: name, withExtension: "wav") {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        }
    }

}

