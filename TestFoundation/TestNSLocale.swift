// This source file is part of the Swift.org open source project
//
// Copyright (c) 2014 - 2016 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See http://swift.org/LICENSE.txt for license information
// See http://swift.org/CONTRIBUTORS.txt for the list of Swift project authors
//

#if DEPLOYMENT_RUNTIME_OBJC || os(Linux)
    import Foundation
    import XCTest
#else
    import SwiftFoundation
    import SwiftXCTest
#endif

class TestNSLocale : XCTestCase {
    static var allTests: [(String, (TestNSLocale) -> () throws -> Void)] {
        return [
            ("test_constants", test_constants),
            ("test_Identifier", test_Identifier),
            ("test_copy", test_copy)
        ]
    }

    func test_Identifier() {
        // Current locale identifier should not be empty
        // Or things like NSNumberFormatter spellOut style won't work
        XCTAssertFalse(Locale.current.identifier.isEmpty)

        let enUSID = "en_US"
        let locale = Locale(identifier: enUSID)
        XCTAssertEqual(enUSID, locale.identifier)

        let deDEID = "de_DE"
        let germanLocale = Locale(identifier: deDEID)
        XCTAssertEqual(deDEID, germanLocale.identifier)
    }
    
    func test_constants() {
        XCTAssertEqual(NSCurrentLocaleDidChangeNotification, "kCFLocaleCurrentLocaleDidChangeNotification",
                        "\(NSCurrentLocaleDidChangeNotification) is not equal to kCFLocaleCurrentLocaleDidChangeNotification")
        
        XCTAssertEqual(NSLocale.Key.identifier.rawValue, "kCFLocaleIdentifierKey",
                        "\(NSLocale.Key.identifier.rawValue) is not equal to kCFLocaleIdentifierKey")

        XCTAssertEqual(NSLocale.Key.languageCode.rawValue, "kCFLocaleLanguageCodeKey",
                        "\(NSLocale.Key.languageCode.rawValue) is not equal to kCFLocaleLanguageCodeKey")

        XCTAssertEqual(NSLocale.Key.countryCode.rawValue, "kCFLocaleCountryCodeKey",
                        "\(NSLocale.Key.countryCode.rawValue) is not equal to kCFLocaleCountryCodeKey")

        XCTAssertEqual(NSLocale.Key.scriptCode.rawValue, "kCFLocaleScriptCodeKey",
                        "\(NSLocale.Key.scriptCode.rawValue) is not equal to kCFLocaleScriptCodeKey")

        XCTAssertEqual(NSLocale.Key.variantCode.rawValue, "kCFLocaleVariantCodeKey",
                        "\(NSLocale.Key.variantCode.rawValue) is not equal to kCFLocaleVariantCodeKey")

        XCTAssertEqual(NSLocale.Key.exemplarCharacterSet.rawValue, "kCFLocaleExemplarCharacterSetKey",
                        "\(NSLocale.Key.exemplarCharacterSet.rawValue) is not equal to kCFLocaleExemplarCharacterSetKey")

        XCTAssertEqual(NSLocale.Key.calendar.rawValue, "kCFLocaleCalendarKey",
                        "\(NSLocale.Key.calendar.rawValue) is not equal to kCFLocaleCalendarKey")

        XCTAssertEqual(NSLocale.Key.collationIdentifier.rawValue, "collation",
                        "\(NSLocale.Key.collationIdentifier.rawValue) is not equal to collation")

        XCTAssertEqual(NSLocale.Key.usesMetricSystem.rawValue, "kCFLocaleUsesMetricSystemKey",
                        "\(NSLocale.Key.usesMetricSystem.rawValue) is not equal to kCFLocaleUsesMetricSystemKey")

        XCTAssertEqual(NSLocale.Key.measurementSystem.rawValue, "kCFLocaleMeasurementSystemKey",
                        "\(NSLocale.Key.measurementSystem.rawValue) is not equal to kCFLocaleMeasurementSystemKey")

        XCTAssertEqual(NSLocale.Key.decimalSeparator.rawValue, "kCFLocaleDecimalSeparatorKey",
                        "\(NSLocale.Key.decimalSeparator.rawValue) is not equal to kCFLocaleDecimalSeparatorKey")

        XCTAssertEqual(NSLocale.Key.groupingSeparator.rawValue, "kCFLocaleGroupingSeparatorKey",
                        "\(NSLocale.Key.groupingSeparator.rawValue) is not equal to kCFLocaleGroupingSeparatorKey")

        XCTAssertEqual(NSLocale.Key.currencySymbol.rawValue, "kCFLocaleCurrencySymbolKey",
                        "\(NSLocale.Key.currencySymbol.rawValue) is not equal to kCFLocaleCurrencySymbolKey")

        XCTAssertEqual(NSLocale.Key.currencyCode.rawValue, "currency",
                        "\(NSLocale.Key.currencyCode.rawValue) is not equal to currency")

        XCTAssertEqual(NSLocale.Key.collatorIdentifier.rawValue, "kCFLocaleCollatorIdentifierKey",
                        "\(NSLocale.Key.collatorIdentifier.rawValue) is not equal to kCFLocaleCollatorIdentifierKey")

        XCTAssertEqual(NSLocale.Key.quotationBeginDelimiterKey.rawValue, "kCFLocaleQuotationBeginDelimiterKey",
                        "\(NSLocale.Key.quotationBeginDelimiterKey.rawValue) is not equal to kCFLocaleQuotationBeginDelimiterKey")

        XCTAssertEqual(NSLocale.Key.quotationEndDelimiterKey.rawValue, "kCFLocaleQuotationEndDelimiterKey",
                        "\(NSLocale.Key.quotationEndDelimiterKey.rawValue) is not equal to kCFLocaleQuotationEndDelimiterKey")

        XCTAssertEqual(NSLocale.Key.alternateQuotationBeginDelimiterKey.rawValue, "kCFLocaleAlternateQuotationBeginDelimiterKey",
                        "\(NSLocale.Key.alternateQuotationBeginDelimiterKey.rawValue) is not equal to kCFLocaleAlternateQuotationBeginDelimiterKey")

        XCTAssertEqual(NSLocale.Key.alternateQuotationEndDelimiterKey.rawValue, "kCFLocaleAlternateQuotationEndDelimiterKey",
                        "\(NSLocale.Key.alternateQuotationEndDelimiterKey.rawValue) is not equal to kCFLocaleAlternateQuotationEndDelimiterKey")

    }

    func test_copy() {
        let locale = Locale(identifier: "en_US")
        let localeCopy = locale

        XCTAssertTrue(locale == localeCopy)
    }
}
