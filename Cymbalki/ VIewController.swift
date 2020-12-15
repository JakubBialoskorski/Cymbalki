import UIKit
import SwiftySound

class ViewController: UIViewController {
    var lastButtonTouched: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //drag finger
    @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
        let point: CGPoint = recognizer.location(in: self.view)
        if let button: UIButton = self.view.hitTest(point, with: nil) as? UIButton {
            let buttonPressedTag: Int = button.tag
            //check if dragged to play another sound
            if lastButtonTouched != buttonPressedTag{
                fadeAndUnfadeButton(ofThisButton: button) //fade while dragging the finger
                playSound(ofButtonTagNumber: buttonPressedTag)
                lastButtonTouched = buttonPressedTag
            } else {
                fadeAndUnfadeButton(ofThisButton: button)
            }
        }
    }
    
    @IBAction func notePressed(_ sender: UIButton) {
        let buttonPressedTag: Int = sender.tag
        //prevent twice sound play
        lastButtonTouched = buttonPressedTag
        fadeAndUnfadeButton(ofThisButton: sender) //fade on pressing one button only
        playSound(ofButtonTagNumber: buttonPressedTag)
    }
    
    //detect button release to reset alpha value
    @IBAction func touchEnd(_ sender: UIButton) {
        fadeAndUnfadeButton(ofThisButton: sender)
    }
    
    //play sound
    func playSound(ofButtonTagNumber buttonTag: Int) {
        let soundURL = Bundle.main.url(forResource: "note\(buttonTag)", withExtension: "wav")
        Sound.play(url: soundURL!)
    }
    
    //fade
    func fadeAndUnfadeButton(ofThisButton button: UIButton) {
        button.alpha=0.5
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            button.alpha=1.0
        }
    }
    
}

// set common settings for buttons
class roundButton: UIButton {
    override func didMoveToWindow() {
        self.layer.cornerRadius = self.bounds.size.height/2
    }
}

