//
//  ZodiacSign.swift
//  Horoscope
//
//  Created by Akim Kasabulatov on 31/03/2018.
//  Copyright © 2018 Akim Kasabulatov. All rights reserved.
//

import Foundation

public enum Zodiac {
    case Aries
    case Taurus
    case Gemini
    case Cancer
    case Lion
    case Virgo
    case Libra
    case Scorpio
    case Sagittarius
    case Capicorn
    case Aquarius
    case Pisces
    case Undefined
}

extension Date {
    public var zodiac: Zodiac {
        guard let gregorianCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
            else { return .Undefined }
        
        let dateComponents = gregorianCalendar.components([.month, .day], from: self)
        
        let month = dateComponents.month
        let day = dateComponents.day
        
        switch (month!, day!) {
        case (3, 21...31), (4, 1...19):
            return .Aries
        case (4, 20...30), (5, 1...20):
            return .Taurus
        case (5, 21...31), (6, 1...20):
            return .Gemini
        case (6, 21...30), (7, 1...22):
            return .Cancer
        case (7, 23...31), (8, 1...22):
            return .Lion
        case (8, 23...31), (9, 1...22):
            return .Virgo
        case (9, 23...30), (10, 1...22):
            return .Libra
        case (10, 23...31), (11, 1...21):
            return .Scorpio
        case (11, 22...30), (12, 1...21):
            return .Sagittarius
        case (12, 22...31), (1, 1...19):
            return .Capicorn
        case (1, 20...31), (2, 1...18):
            return .Aquarius
        case (2, 19...29), (3, 1...20):
            return .Pisces
        default:
            return .Undefined
        }
    }
}
