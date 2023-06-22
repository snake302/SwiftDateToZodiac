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
    case Capricorn
    case Aquarius
    case Pisces
    case Undefined
}

extension Zodiac: CaseIterable {
    public static var allCases: [Zodiac] = [
        .Aries,
        .Taurus,
        .Gemini,
        .Cancer,
        .Lion,
        .Virgo,
        .Libra,
        .Scorpio,
        .Sagittarius,
        .Capricorn,
        .Aquarius,
        .Pisces
    ]
}

extension Zodiac {
    public var sign: Character {
        switch self {
        case .Aries:       return "\u{2648}"
        case .Taurus:      return "\u{2649}"
        case .Gemini:      return "\u{264A}"
        case .Cancer:      return "\u{264B}"
        case .Lion:        return "\u{264C}"
        case .Virgo:       return "\u{264D}"
        case .Libra:       return "\u{264E}"
        case .Scorpio:     return "\u{264F}"
        case .Sagittarius: return "\u{2650}"
        case .Capricorn:   return "\u{2651}"
        case .Aquarius:    return "\u{2652}"
        case .Pisces:      return "\u{2653}"
        default:           return "?"
        }
    }
    
    public var name: String {
        switch self {
        case .Aries:       return "Aries"
        case .Taurus:      return "Taurus"
        case .Gemini:      return "Gemini"
        case .Cancer:      return "Cancer"
        case .Lion:        return "Lion"
        case .Virgo:       return "Virgo"
        case .Libra:       return "Libra"
        case .Scorpio:     return "Scorpio"
        case .Sagittarius: return "Sagittarius"
        case .Capricorn:   return "Capricorn"
        case .Aquarius:    return "Aquarius"
        case .Pisces:      return "Pisces"
        default:           return "Undefined"
        }
    }
}

extension Zodiac: Hashable {}

extension Zodiac: CustomStringConvertible {
    public var description: String {
        name
    }
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
            return .Capricorn
        case (1, 20...31), (2, 1...18):
            return .Aquarius
        case (2, 19...29), (3, 1...20):
            return .Pisces
        default:
            return .Undefined
        }
    }
}
