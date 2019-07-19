//
//  ToDoDataModel.swift
//  Todofie
//
//  Created by Vikas R S on 7/15/19.
//  Copyright © 2019 Vikas Radhakrishna Shetty. All rights reserved.
//

import Foundation
import UIKit

class ToDoDataModel: Encodable{
 
    var title:String = ""
    
    var done:Bool = false
}
