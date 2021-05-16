//
//  ViewController.swift
//  xylophone
//
//  Created by Josh Courtney on 4/22/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func keyTapped(_ sender: UIButton) {
        playSound(button: sender)
        dim(button: sender)
    }
    
    func playSound(button: UIButton) {
        guard let url = Bundle.main.url(forResource: button.titleLabel?.text, withExtension: "wav") else {
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            player = try AVAudioPlayer(contentsOf: url)

            guard let player = player else { return }

            player.play()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func dim(button: UIButton) {
        button.alpha = 0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            button.alpha = 1.0
        }
    }

}
