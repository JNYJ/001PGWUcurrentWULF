//
//  JNYJ.swift
//  002ADPXYIET(open_in)
//
//  Created by JNYJ on 14-11-12.
//  Copyright (c) 2014年 JNYJ. All rights reserved.
//

import UIKit

class JNYJ: NSObject {
	class func isRunningiOS80()->Bool{
		var device : UIDevice = UIDevice.currentDevice();
		var systemVersion = device.systemVersion;

		var iosVerion : Double = NSString(string: systemVersion).doubleValue;

		if(iosVerion < 8.0) {
			return false
		}else{
			return true
		}
	}
}
