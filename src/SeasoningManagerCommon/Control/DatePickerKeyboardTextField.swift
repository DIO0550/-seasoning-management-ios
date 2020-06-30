//
//  DatePickerKeyboardTextField.swift
//  SeasoningManagerCommon
//
//  Created by DIO on 2020/06/28.
//  Copyright © 2020 DIO0550. All rights reserved.
//

import UIKit
/// 参考：https://qiita.com/wai21/items/c25740cbf1ce0c031eff
class DatePickerKeyboardTextField: UITextField {

    private lazy var datePicker: UIDatePicker = {
        var picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.locale = Locale(identifier: "ja")
        return picker
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.commonInit()
    }
    
    private func commonInit() {
        self.inputView = self.datePicker;
    }
}
