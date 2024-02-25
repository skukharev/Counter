//
//  ViewController.swift
//  Counter
//
//  Created by Сергей Кухарев on 25.02.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var clearCounterButton: UIButton!;
    @IBOutlet weak var historyOfChangesTextView: UITextView!;
    @IBOutlet weak var counterLabel: UILabel!;
    @IBOutlet weak var incrementCounterButton: UIButton!;
    @IBOutlet weak var decrementCounterButton: UIButton!;

    private var internalCounter: Int = 0;
    let emptyValue: Int = -100;
    
    var applicationCounter: Int {
        get {
            return internalCounter;
        }
        set {
            if (newValue == emptyValue) {
                internalCounter = 0;
                counterLabel.text = "Значение счётчика: " + internalCounter.intToString;
            } else {
                if (newValue >= 0) {
                    if (newValue != internalCounter) {
                        let changeMode = newValue > internalCounter ? "+1" : "-1";
                        addToHistoryOfChanges(text: ": значение изменено на " + changeMode);
                    }
                    internalCounter = newValue;
                    counterLabel.text = "Значение счётчика: " + internalCounter.intToString;
                } else {
                    addToHistoryOfChanges(text: ": попытка уменьшить значение счётчика ниже 0");
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();

        historyOfChangesTextView.text = "История изменений:\n";
        historyOfChangesTextView.isEditable = false;
        applicationCounter = 0;
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        //Увеличение изображения кнопки в 3 раза
        incrementCounterButton.imageView?.layer.transform = CATransform3DMakeScale(5.0, 5.0, 5.0);
    }
    
    @IBAction func clearCounterButtonTouchUpInside(_ sender: Any) {
        applicationCounter = emptyValue;
        addToHistoryOfChanges(text: ": значение сброшено");
   }
    
    @IBAction func incrementCounterTouchUpInside(_ sender: Any) {
        applicationCounter += 1;
        
        let impactHeavy = UIImpactFeedbackGenerator(style: .light);
        impactHeavy.impactOccurred();
    }
    
    @IBAction func decrementCounterButtonTouchUpInside(_ sender: Any) {
        applicationCounter -= 1;
    }
    
    func addToHistoryOfChanges(text: String) {
        let date = Date();
        historyOfChangesTextView.text += date.dateTimeString + text + "\n";
        //Скроллинг текстового списка к последней строке
        let bottom = NSMakeRange(historyOfChangesTextView.text.count - 1, 1);
        historyOfChangesTextView.scrollRangeToVisible(bottom);
    }
    
}

