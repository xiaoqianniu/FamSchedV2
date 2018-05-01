//
//  ScheduleModel.swift
//  FamSchedV2
//
//  Created by Hongbo Niu on 2018-04-26.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import Foundation
import RealmSwift

class ScheduleModel:Object {
    @objc dynamic var memberName : String = ""
    @objc dynamic var whatDate : String = ""
    @objc dynamic var famThings : String = ""
    @objc dynamic var location : String = ""
}
