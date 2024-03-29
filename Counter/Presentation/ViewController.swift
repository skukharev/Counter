//
//  ViewController.swift
//  Counter
//
//  Created by Сергей Кухарев on 25.02.2024.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var clearCounterButton: UIButton!;
    @IBOutlet private weak var historyOfChangesTextView: UITextView!;
    @IBOutlet private weak var counterLabel: UILabel!;
    @IBOutlet private weak var incrementCounterButton: UIButton!;
    @IBOutlet private weak var decrementCounterButton: UIButton!;

    private var internalCounter: Int = 0;
    let emptyValue: Int = -100;
    
    private var applicationCounter: Int {
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
    
    @IBAction private func clearCounterButtonTouchUpInside(_ sender: Any) {
        applicationCounter = emptyValue;
        addToHistoryOfChanges(text: ": значение сброшено");
   }
    
    @IBAction private func incrementCounterTouchUpInside(_ sender: Any) {
        applicationCounter += 1;
        
        let impactHeavy = UIImpactFeedbackGenerator(style: .light);
        impactHeavy.impactOccurred();
    }
    
    @IBAction private func decrementCounterButtonTouchUpInside(_ sender: Any) {
        applicationCounter -= 1;
    }
    
    private func addToHistoryOfChanges(text: String) {
        let date = Date();
        historyOfChangesTextView.text += date.dateTimeString + text + "\n";
        //Скроллинг текстового списка к последней строке
        let bottom = NSMakeRange(historyOfChangesTextView.text.count - 1, 1);
        historyOfChangesTextView.scrollRangeToVisible(bottom);
    }
    
}

