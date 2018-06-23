//
//  ViewController.swift
//  One50
//
//  Created by MAC BOOK on 20/06/18.
//  Copyright © 2018 MAC BOOK. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate
{
   

    //Sumanth Commit 3
    //Subhash Commit 2
    //Subhash Commit 1
    // sumanth Commit 2
    let image = UIImage(named: "RadioSelected.png")
    let image2 = UIImage(named: "RadioUnSelected.png")
    let image3 = UIImage(named: "checkbox.png")
    let image4 = UIImage(named: "unCheckbox.png")
    //
    var datePicker = UIDatePicker()
   // date picker we are using for
    var activityCount = 0
    
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    
     @IBOutlet weak var btnCheckboxrun: UIButton!
     @IBOutlet weak var btnCheckboxwalk: UIButton!
     @IBOutlet weak var btnCheckboxcycle: UIButton!
    var p = [String]()
    var TFCount = 0
    
    func PickupEndDate(_ textField : UITextField){

        // DatePicker

        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePickerMode.date
        endDateTF.inputView = self.datePicker

        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()

        // Adding Button ToolBar



        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.doneSumanth))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ViewController.cancelvivek))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        endDateTF.inputAccessoryView = toolBar
    }

    
    
    
    @IBAction func SearchAct(_ sender: Any)
    {
       // getApiMethod()
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChallengeViewController") as! ChallengeViewController
//       self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func doneSumanth()
    {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        // let myString = (String(describing: date))
        dateFormatter1.dateFormat = "dd/MM/YYYY"
        endDateTF.text = dateFormatter1.string(from: datePicker.date)
        endDateTF.resignFirstResponder()
    }
    @objc func cancelvivek()
    {
        endDateTF.resignFirstResponder()
    }

    func pickUpDate(_ textField : UITextField){

        // DatePicker

        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePickerMode.date
        startDateTF.inputView = self.datePicker

        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()

        // Adding Button ToolBar



        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        startDateTF.inputAccessoryView = toolBar
    }

    @objc func doneClick()
    {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        // let myString = (String(describing: date))
        dateFormatter1.dateFormat = "dd/MM/YYYY"
        startDateTF.text = dateFormatter1.string(from: datePicker.date)
        startDateTF.resignFirstResponder()
    }
    @objc func cancelClick()
    {
        startDateTF.resignFirstResponder()
    }

    
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        if textField == ChallengeTF
        {
            TFCount = 0
          
            p = challengesArray as! [String]
            self.getApiMethod()
            pickerview.reloadAllComponents()
            
        }
        if textField == CountryTF
        {
            TFCount = 1
            p = countryArray as! [String]
            pickerview.reloadAllComponents()

           
        }
        
        if textField == StateTF
        {
            TFCount = 2
            p = statesArray as! [String]
            pickerview.reloadAllComponents()
            
           
        }
        
        if textField == CityTF
        {
            TFCount = 3
            p = citiesArray as! [String]
            pickerview.reloadAllComponents()
            
            
        }
        
        if textField == KeypeopleTF
        {
            TFCount = 4
            p = keypeopleArray as! [String]
            pickerview.reloadAllComponents()
            
            
        }
        
        if textField == ChallTFSel
        {
            TFCount = 5
            p = challengeCauseArray as! [String]
            pickerview.reloadAllComponents()
        
        }
        
        if textField == startDateTF
        {
            self.pickUpDate(self.startDateTF)
        }

        if textField == endDateTF
        {
            self.PickupEndDate(self.endDateTF)
        }
       
    }
    
    

    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        return p.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       
        
            return p[row]
       
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if TFCount == 0
        {
           
            ChallengeTF.text = p[row]
            ChallengeTF.resignFirstResponder()
        }
        if TFCount == 1
        {
            CountryTF.text = p[row]
            CountryTF.resignFirstResponder()
        }
        if TFCount == 2
        {
            StateTF.text = p[row]
            StateTF.resignFirstResponder()
        }
        if TFCount == 3
        {
            CityTF.text = p[row]
            CityTF.resignFirstResponder()
        }
        if TFCount == 4
        {
            KeypeopleTF.text = p[row]
            KeypeopleTF.resignFirstResponder()
        }
        if TFCount == 5
        {
            ChallTFSel.text = p[row]
            ChallTFSel.resignFirstResponder()
        }
        if TFCount == 6
        {
            ChallTFSel.text = p[row]
            ChallTFSel.resignFirstResponder()
        }

        if TFCount == 7
        {
            ChallTFSel.text = p[row]
            ChallTFSel.resignFirstResponder()
        }
       

    }
    
    
    @IBOutlet weak var ChallengeTF: UITextField!
    
    @IBOutlet weak var CountryTF: UITextField!
    
    @IBOutlet weak var StateTF: UITextField!
    
    @IBOutlet weak var CityTF: UITextField!
    
    @IBOutlet weak var KeypeopleTF: UITextField!
    
    @IBOutlet weak var ChallTFSel: UITextField!
    
    @IBOutlet weak var startDateTF: UITextField!
    
    @IBOutlet weak var endDateTF: UITextField!
    
    var challengesArray = [String]()
    
    var countryArray =  [String]()

    
    var statesArray =  [String]()

    var citiesArray =  [String]()

    var keypeopleArray =  [String]()

    var challengeCauseArray = [String]()

    override func viewDidLoad()
    {
        super.viewDidLoad()
        getApiMethod()
       
      
        endDateTF.delegate = self
        ChallengeTF.delegate = self
        CountryTF.delegate = self
        StateTF.delegate = self
        CityTF.delegate = self
        KeypeopleTF.delegate = self
        ChallTFSel.delegate = self
        startDateTF.delegate = self
        endDateTF.delegate = self
       
        pickerview.delegate = self
        pickerview.dataSource = self
        ChallengeTF.inputView = pickerview
        ChallengeTF.textAlignment = .center
        CountryTF.inputView = pickerview
        CountryTF.textAlignment = .center
        StateTF.inputView = pickerview
        StateTF.textAlignment = .center
        CityTF.inputView = pickerview
        CityTF.textAlignment = .center
        KeypeopleTF.inputView = pickerview
        KeypeopleTF.textAlignment = .center
        ChallTFSel.inputView = pickerview
        ChallTFSel.textAlignment = .center
    }

    var pickerview = UIPickerView()
   
    
    @IBAction func onTapYesBtn(_ sender: Any)
    {
        self.yesBtn.setImage(image, for: .normal)
        self.noBtn.setImage(image2, for: .normal)
       
       
    }
    
    @IBAction func onTapNoBtn(_ sender: Any)
    {
        
        self.noBtn.setImage(image, for: .normal)
        self.yesBtn.setImage(image2, for: .normal)
        
    }

    
    @IBAction func runaction(_ sender: UIButton) {
       
        if activityCount%2 == 0
        {
            self.btnCheckboxrun.setImage(image3, for: .normal)
        }
        else
        {
            self.btnCheckboxrun.setImage(image4, for: .normal)
        }
        activityCount += 1
       // self.btnCheckboxwalk.setImage(image4, for: .normal)
       // self.btnCheckboxcycle.setImage(image4, for: .normal)
    }
    @IBAction func walkact(_ sender: Any) {
        if activityCount%2 == 0
        {
         self.btnCheckboxwalk.setImage(image3, for: .normal)
        }
        else
        {
            self.btnCheckboxwalk.setImage(image4, for: .normal)
        }
        activityCount += 1
       // self.btnCheckboxrun.setImage(image4, for: .normal)
       // self.btnCheckboxwalk.setImage(image3, for: .normal)
       // self.btnCheckboxcycle.setImage(image4, for: .normal)
    }
    
    @IBAction func cycleaction(_ sender: UIButton)
    {
        if activityCount%2 == 0
        {
            self.btnCheckboxcycle.setImage(image3, for: .normal)
        }
        else
        {
            self.btnCheckboxcycle.setImage(image4, for: .normal)
        }
        activityCount += 1
       // self.btnCheckboxrun.setImage(image4, for: .normal)
       // self.btnCheckboxwalk.setImage(image4, for: .normal)
       // self.btnCheckboxcycle.setImage(image3, for: .normal)
    }
    
    func getApiMethod ()
    {
        let url = URL(string: "http://192.168.1.130/mohan/onefifty/webservice/searchActivityDynamic.php")!
        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if (error != nil) {
                print("error")
            } else {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options:.allowFragments) as! [String : AnyObject]
                    
                    print(json as NSDictionary)
                
                    
                    let x = json["data"] as! [String : Any]
                    let y = json["location"] as! [String : Any]
                    
                    let p = x["CauseName"] as! [String]
                    let o = x["challengeName"] as! [String]
                    let m = x["keyPeopleName"] as! [String]
                
                    let n = y["country"] as! [String]
                    let q = y["state"] as! [String]
                    let r = y["city"] as! [String]
                    print(p[0])
                    
           
                    self.challengeCauseArray = p
                    self.challengesArray = o
                    self.keypeopleArray = m
                    self.countryArray = n
                    self.statesArray = q
                    self.citiesArray = r
                    
                    
//                    for obj in 0..<(valueArry.count - 1)
//                    {
                    
//                         let s = String(obj)
//                         let dictVal = json[s]
//                         let titleString = dictVal!["CauseName"] as! String
////                        let dateString  = dictVal!["riderAction"] as! String
////                        let date1String  = dictVal!["amount"] as! String
////                        let mystring = dictVal!["date"] as! String
//                        print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
//                        // print("HEllllllllllllllllllll")
//                        print(titleString)
////                        print(dateString)
////                        print(date1String)
////                        print(mystring)
//                        self.challengesArray.append(titleString)
//
//
//                    }
                    
                    
                    
                    
                } catch let error as NSError{
                    print(error)
                }
            }
        }).resume()
    }
}


