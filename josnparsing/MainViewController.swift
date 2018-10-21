//
//  MainViewController.swift
//  josnparsing
//
//  Created by mac on 26/09/18.
//  Copyright © 2018 jeky. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var Date: UITextField!
    @IBOutlet var ToCode: UITextField!
    @IBOutlet var FromeCode: UITextField!
    
    let DatePicker = UIDatePicker()
    var dic : [Any] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func Done(_ sender: Any)
    {
        dic.insert(FromeCode.text!, at: 0)
        dic.insert(ToCode.text!, at: 1)
        dic.insert(Date.text!, at: 2)
        
        print(dic)
        let nav = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        nav.DataDic = dic
        
        self.navigationController?.pushViewController(nav, animated: true)
    }
    
    func CreateDatePicker()
    {
        DatePicker.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 200)
        DatePicker.datePickerMode = .date
        Date.inputView = DatePicker
        DatePicker.addTarget(self, action: #selector(self.SetDate), for:.valueChanged)
    }
    
    @objc func SetDate(sender:UIDatePicker)
    {
        let date = DatePicker.date
        let format = DateFormatter()
        format.dateFormat = "dd-MM-yyyy"
        Date.text = format.string(from: date)
    }
    
}

extension MainViewController:UITextFieldDelegate
{
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return self.view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.tag == 1
        {
            CreateDatePicker()
            return true
        }
        else
        {
            return true
        }
    }
}
