//
//  ImageAsset.swift
//  LMS_NTG_Project
//
//  Created by Tahani on 12/02/1447 AH.
//

import Foundation
import PhotosUI

struct ImageAsset: Identifiable {
    
    let id: String = UUID().uuidString
    let asset: PHAsset
    let thumbnail: UIImage?
    let assetIndex: Int = -1
}
