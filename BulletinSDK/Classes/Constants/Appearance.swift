//
//  WZAppearance.swift
//  WazirX
//
//  Created by Daxesh Nagar on 17/07/23.
//  Copyright © 2017 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

public enum Appearance: String  {
    
    // MARK: Types
    case darkKnight
    case whiteKnight
    
    
    // MARK: Constants
    public static func DefaultAnimationDuration() -> TimeInterval { return 0.3 }
//    public static func Current() -> Appearance {
//        return UserDefaults.lastSelectedAppearance() ?? .darkKnight
//    }
    
    
    // MARK: Conveniance Method To Apply Any Appearance
    public func apply(shouldBroadcastUpdate: Bool)  {
        
        // Apply Appropriate Themes
        switch self {
        case .darkKnight:
            applyMidnightBlueAppearance()
        case .whiteKnight:
            applyDefaultAppearance()
        }
        
        
        // Update UISwitch Appearance
        UISwitch.appearance().onTintColor = AppStyle.Color.SwitchOn
        
        // Update UITextField Appearance
        UITextField.appearance().keyboardAppearance = AppStyle.KeyboardAppearance
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: AppStyle.Color.PrimaryText]
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = AppStyle.Color.SelectedElement
        
        // Update UIRefreshControl Appearance
        UIRefreshControl.appearance().tintColor = AppStyle.Color.Loader
        
        // Update UIToolBar Appearance
        UIToolbar.appearance().tintColor = AppStyle.Color.SelectedElement
        UIToolbar.appearance().barTintColor = AppStyle.Color.Background

        
        // Broadcast Appearance Update Notification
        if shouldBroadcastUpdate == true   {
            NotificationCenter.default.post(name: .AppearanceDidUpdate, object: nil, userInfo: nil)
        }
    }
    
    
    // MARK: Helper Methods
    
    private func applyDefaultAppearance()    {
        
        // ------- New Color Styles ------- //
        AppStyle.Color.MainTextPrimary = AppStyle.ColorTokens.Gray_100
        AppStyle.Color.MainTextSecondary = AppStyle.ColorTokens.Gray_50
        AppStyle.Color.MainTextTertiary = AppStyle.ColorTokens.Gray_40
        
        AppStyle.Color.MainBrandPrimary = AppStyle.ColorTokens.Blue_60
        
        AppStyle.Color.MainNavigationOnNavigation = AppStyle.ColorTokens.White
        AppStyle.Color.MainNavigationBg = AppStyle.ColorTokens.Blue_60
        
        AppStyle.Color.MainBgSurface = AppStyle.ColorTokens.Gray_20
        AppStyle.Color.MainBgSurface_Alt = AppStyle.ColorTokens.White
        AppStyle.Color.MainBgPrimary = AppStyle.ColorTokens.White
        AppStyle.Color.MainBgSecondary = AppStyle.ColorTokens.Gray_10
        AppStyle.Color.MainBgTertiary = AppStyle.ColorTokens.Gray_30
        
        AppStyle.Color.BrandTextPrimary = AppStyle.ColorTokens.Blue_60
        AppStyle.Color.BrandTextSecondary = AppStyle.ColorTokens.Blue_30
        AppStyle.Color.BrandTextOnMuted = AppStyle.ColorTokens.Blue_60
        AppStyle.Color.BrandTextOnPrimary = AppStyle.ColorTokens.White
        AppStyle.Color.BrandBgPrimary = AppStyle.ColorTokens.Blue_60
        AppStyle.Color.BrandBgMuted = AppStyle.ColorTokens.Blue_10
        AppStyle.Color.BrandBgMuted_Border = AppStyle.ColorTokens.Blue_20
        
        AppStyle.Color.SuccessTextPrimary = AppStyle.ColorTokens.Green_60
        AppStyle.Color.SuccessTextOnMuted = AppStyle.ColorTokens.Green_60
        AppStyle.Color.SuccessTextOnPrimary = AppStyle.ColorTokens.White
        AppStyle.Color.SuccessBgPrimary = AppStyle.ColorTokens.Green_60
        AppStyle.Color.SuccessBgMuted = AppStyle.ColorTokens.Green_10
        AppStyle.Color.SuccessBgMuted_Border = AppStyle.ColorTokens.Green_20
        
        AppStyle.Color.DangerTextPrimary = AppStyle.ColorTokens.Red_60
        AppStyle.Color.DangerTextOnMuted = AppStyle.ColorTokens.Red_60
        AppStyle.Color.DangerTextOnPrimary = AppStyle.ColorTokens.White
        AppStyle.Color.DangerBgPrimary = AppStyle.ColorTokens.Red_60
        AppStyle.Color.DangerBgMuted = AppStyle.ColorTokens.Red_10
        AppStyle.Color.DangerBgMuted_Border = AppStyle.ColorTokens.Red_20

        AppStyle.Color.WarningTextPrimary = AppStyle.ColorTokens.Yellow_70
        AppStyle.Color.WarningTextOnMuted = AppStyle.ColorTokens.Yellow_90
        AppStyle.Color.WarningTextOnPrimary = AppStyle.ColorTokens.Yellow_100
        AppStyle.Color.WarningBgPrimary = AppStyle.ColorTokens.Yellow_50
        AppStyle.Color.WarningBgMuted = AppStyle.ColorTokens.Yellow_20
        AppStyle.Color.WarningBgMuted_Border = AppStyle.ColorTokens.Yellow_30
        
        AppStyle.Color.Brand_AltTextPrimary = AppStyle.ColorTokens.Orange_60
        AppStyle.Color.Brand_AltTextSecondary = AppStyle.ColorTokens.Orange_30
        AppStyle.Color.Brand_AltTextOnMuted = AppStyle.ColorTokens.Orange_60
        AppStyle.Color.Brand_AltTextOnPrimary = AppStyle.ColorTokens.White
        AppStyle.Color.Brand_AltBgPrimary = AppStyle.ColorTokens.Orange_60
        AppStyle.Color.Brand_AltBgMuted = AppStyle.ColorTokens.Orange_10
        AppStyle.Color.Brand_AltBgDisabled = AppStyle.ColorTokens.Orange_40

        AppStyle.Color.AttentionTextPrimary = AppStyle.ColorTokens.Orange_60
        AppStyle.Color.AttentionTextOnMuted = AppStyle.ColorTokens.Orange_60
        AppStyle.Color.AttentionTextOnPrimary = AppStyle.ColorTokens.White
        AppStyle.Color.AttentionBgPrimary = AppStyle.ColorTokens.Orange_60
        AppStyle.Color.AttentionBgMuted = AppStyle.ColorTokens.Orange_10
        AppStyle.Color.AttentionBgMuted_Border = AppStyle.ColorTokens.Orange_20
        
        AppStyle.Color.MiscHome_Bar = AppStyle.ColorTokens.Black
    }
    
    private func applyMidnightBlueAppearance()    {
        
        
        // ------- New Color Styles ------- //
        AppStyle.Color.MainTextPrimary = AppStyle.ColorTokens.Gray_30
        AppStyle.Color.MainTextSecondary = AppStyle.ColorTokens.Gray_50
        AppStyle.Color.MainTextTertiary = AppStyle.ColorTokens.Gray_60
        
        AppStyle.Color.MainBrandPrimary = AppStyle.ColorTokens.Blue_40
        
        AppStyle.Color.MainNavigationOnNavigation = AppStyle.ColorTokens.Gray_30
        AppStyle.Color.MainNavigationBg = AppStyle.ColorTokens.Gray_80
        
        AppStyle.Color.MainBgSurface = AppStyle.ColorTokens.Gray_100
        AppStyle.Color.MainBgSurface_Alt = AppStyle.ColorTokens.Gray_100
        AppStyle.Color.MainBgPrimary = AppStyle.ColorTokens.Gray_80
        AppStyle.Color.MainBgSecondary = AppStyle.ColorTokens.Gray_90
        AppStyle.Color.MainBgTertiary = AppStyle.ColorTokens.Gray_70
        
        AppStyle.Color.BrandTextPrimary = AppStyle.ColorTokens.Blue_40
        AppStyle.Color.BrandTextSecondary = AppStyle.ColorTokens.Blue_20
        AppStyle.Color.BrandTextOnMuted = AppStyle.ColorTokens.Blue_40
        AppStyle.Color.BrandTextOnPrimary = AppStyle.ColorTokens.White
        AppStyle.Color.BrandBgPrimary = AppStyle.ColorTokens.Blue_40
        AppStyle.Color.BrandBgMuted = AppStyle.ColorTokens.Blue_90
        AppStyle.Color.BrandBgMuted_Border = AppStyle.ColorTokens.Blue_80
        
        AppStyle.Color.SuccessTextPrimary = AppStyle.ColorTokens.Green_40
        AppStyle.Color.SuccessTextOnMuted = AppStyle.ColorTokens.Green_30
        AppStyle.Color.SuccessTextOnPrimary = AppStyle.ColorTokens.White
        AppStyle.Color.SuccessBgPrimary = AppStyle.ColorTokens.Green_50
        AppStyle.Color.SuccessBgMuted = AppStyle.ColorTokens.Green_80
        AppStyle.Color.SuccessBgMuted_Border = AppStyle.ColorTokens.Green_70
        
        AppStyle.Color.DangerTextPrimary = AppStyle.ColorTokens.Red_50
        AppStyle.Color.DangerTextOnMuted = AppStyle.ColorTokens.Red_30
        AppStyle.Color.DangerTextOnPrimary = AppStyle.ColorTokens.White
        AppStyle.Color.DangerBgPrimary = AppStyle.ColorTokens.Red_50
        AppStyle.Color.DangerBgMuted = AppStyle.ColorTokens.Red_100
        AppStyle.Color.DangerBgMuted_Border = AppStyle.ColorTokens.Red_90

        AppStyle.Color.WarningTextPrimary = AppStyle.ColorTokens.Yellow_50
        AppStyle.Color.WarningTextOnMuted = AppStyle.ColorTokens.Yellow_20
        AppStyle.Color.WarningTextOnPrimary = AppStyle.ColorTokens.Yellow_100
        AppStyle.Color.WarningBgPrimary = AppStyle.ColorTokens.Yellow_50
        AppStyle.Color.WarningBgMuted = AppStyle.ColorTokens.Yellow_100
        AppStyle.Color.WarningBgMuted_Border = AppStyle.ColorTokens.Yellow_90
        
        AppStyle.Color.Brand_AltTextPrimary = AppStyle.ColorTokens.Blue_40
        AppStyle.Color.Brand_AltTextSecondary = AppStyle.ColorTokens.Blue_20
        AppStyle.Color.Brand_AltTextOnMuted = AppStyle.ColorTokens.Blue_40
        AppStyle.Color.Brand_AltTextOnPrimary = AppStyle.ColorTokens.White
        AppStyle.Color.Brand_AltBgPrimary = AppStyle.ColorTokens.Blue_40
        AppStyle.Color.Brand_AltBgMuted = AppStyle.ColorTokens.Blue_90
        AppStyle.Color.Brand_AltBgDisabled = AppStyle.ColorTokens.Blue_40

        AppStyle.Color.AttentionTextPrimary = AppStyle.ColorTokens.Orange_50
        AppStyle.Color.AttentionTextOnMuted = AppStyle.ColorTokens.Orange_30
        AppStyle.Color.AttentionTextOnPrimary = AppStyle.ColorTokens.Orange_100
        AppStyle.Color.AttentionBgPrimary = AppStyle.ColorTokens.Orange_50
        AppStyle.Color.AttentionBgMuted = AppStyle.ColorTokens.Orange_100
        AppStyle.Color.AttentionBgMuted_Border = AppStyle.ColorTokens.Orange_90
        
        AppStyle.Color.MiscHome_Bar = AppStyle.ColorTokens.White
    }
}


public struct AppStyle {
    
    // MARK: - Colors
    public struct ColorTokens {
        
        public static var Black = UIColor.black
        
        public static var White = UIColor.white
        
        public static var Gray_10 = UIColor("#FBFCFE")
        public static var Gray_20 = UIColor("#F2F2F8")
        public static var Gray_30 = UIColor("#D9E1EB")
        public static var Gray_40 = UIColor("#A0AAB5")
        public static var Gray_50 = UIColor("#6F7F90")
        public static var Gray_60 = UIColor("#4C5C70")
        public static var Gray_70 = UIColor("#2E3E54")
        public static var Gray_80 = UIColor("#232F3F")
        public static var Gray_90 = UIColor("#212C3A")
        public static var Gray_100 = UIColor("#1A212B")
        
        public static var Red_10 = UIColor("#FFEFEF")
        public static var Red_20 = UIColor("#fed7d7")
        public static var Red_30 = UIColor("#feb2b2")
        public static var Red_40 = UIColor("#fc8181")
        public static var Red_50 = UIColor("#f56565")
        public static var Red_60 = UIColor("#e53e3e")
        public static var Red_70 = UIColor("#c53030")
        public static var Red_80 = UIColor("#9b2c2c")
        public static var Red_90 = UIColor("#742a2a")
        public static var Red_100 = UIColor("#4B2830")

        public static var Yellow_10 = UIColor("#fffff0")
        public static var Yellow_20 = UIColor("#fefcbf")
        public static var Yellow_30 = UIColor("#faf089")
        public static var Yellow_40 = UIColor("#f6e05e")
        public static var Yellow_50 = UIColor("#ecc94b")
        public static var Yellow_60 = UIColor("#d69e2e")
        public static var Yellow_70 = UIColor("#b7791f")
        public static var Yellow_80 = UIColor("#975a16")
        public static var Yellow_90 = UIColor("#744210")
        public static var Yellow_100 = UIColor("#4F3502")

        public static var Green_10 = UIColor("#E0FAEE")
        public static var Green_20 = UIColor("#ABEDCF")
        public static var Green_30 = UIColor("#7BDBB0")
        public static var Green_40 = UIColor("#56C292")
        public static var Green_50 = UIColor("#3BA073")
        public static var Green_60 = UIColor("#287D57")
        public static var Green_70 = UIColor("#1D5E41")
        public static var Green_80 = UIColor("#16422E")
        public static var Green_90 = UIColor("#123023")

        public static var Blue_10 = UIColor("#E8EEFD")
        public static var Blue_20 = UIColor("#B6C9FA")
        public static var Blue_30 = UIColor("#96B2F7")
        public static var Blue_40 = UIColor("#2DA4FE")
        public static var Blue_50 = UIColor("#167CF9")
        public static var Blue_60 = UIColor("#3067F0")
        public static var Blue_70 = UIColor("#1746BD")
        public static var Blue_80 = UIColor("#2A5573")
        public static var Blue_90 = UIColor("#19364A")
        
        public static var Orange_10 = UIColor("#FDEFE9")
        public static var Orange_20 = UIColor("#FAE0D4")
        public static var Orange_30 = UIColor("#F6C4AD")
        public static var Orange_40 = UIColor("#F1A07B")
        public static var Orange_50 = UIColor("#EE895B")
        public static var Orange_60 = UIColor("#E86427")
        public static var Orange_70 = UIColor("#BF5728")
        public static var Orange_80 = UIColor("#964929")
        public static var Orange_90 = UIColor("#713D29")
        public static var Orange_100 = UIColor("#4B312A")
    }
    
    public struct Color {
        
        public static var Primary = UIColor.black
        public static var PrimaryContrast = UIColor.lightGray
        public static var Accent = UIColor.lightGray
        public static var Accent2 = UIColor.white
        public static var Accent2Contrast = UIColor.black
        
        public static var Background = UIColor.lightGray
        public static var BackgroundHighlight = UIColor.lightGray
        public static var SegmentSelectedBackground = UIColor.lightGray
        public static var SegmentUnselectedBackground = UIColor.lightGray
        public static var SegmentUnselectedBackgroundOnNonWhiteBackground = UIColor.lightGray
        public static var LightBackground = UIColor.white
        public static var LightBackgroundContrast = UIColor.white
        public static var DarkBackground = UIColor.lightGray
        public static var WalletBallanceDetailsBackground = UIColor.lightGray
        
        public static var LowEmphasisBackground = UIColor.systemBlue
        public static var LowEmphasisText = UIColor.lightText
        public static var LowEmphasisSubText = UIColor.lightText
        
        public static var MediumEmphasisBackground = UIColor.yellow
        public static var MediumEmphasisText = UIColor.lightText
        public static var MediumEmphasisSubText = UIColor.lightText
        
        public static var MediumEmphasisButton = UIColor.yellow
        public static var MediumEmphasisButtonText = UIColor.lightText
        
        public static var HighEmphasisBackground = UIColor.red
        public static var HighEmphasisText = UIColor.red
        public static var HighEmphasisSubText = UIColor.red
        
        public static var PrimaryText = UIColor.black
        public static var SecondaryText = UIColor.lightGray
        
        public static var NavigationItem = UIColor.white
        public static var BannerText = UIColor.black
        public static var SecondaryBlueWithAlpha = UIColor("#27A8FF").withAlphaComponent(0.15)
        
        public static var Loader = UIColor.lightGray
        
        public static var TabBar = UIColor.white
        public static var TabBarItemUnselected = UIColor.lightGray
        public static var TabBarItemSelected = Primary
        
        public static var SwitchOn = UIColor.green
        
        public static var PrimaryGreen = UIColor.green
        public static var PrimaryRed = UIColor.red
        
        public static var ChartBackground = UIColor.white
        public static var ChartGreen = UIColor.green
        public static var ChartRed = UIColor.red
        public static var Chart2Green = UIColor.green
        public static var Chart2Red = UIColor.red
        public static var ChartGrid = UIColor.lightGray
        public static var ChartText = UIColor.lightGray
        public static var ChartAxisLineColor = UIColor.lightGray
        
        public static var OrderBookGreen = UIColor.green
        public static var OrderBookRed = UIColor.red
        public static var OrderBookModeButtonColor = UIColor.black
        public static var OrderBookModeButtonTextColor = UIColor.white
        
        public static var TradeHistoryGreen = UIColor.green
        public static var TradeHistoryRed = UIColor.red
        
        public static var CellBackground = UIColor.white
        public static var CellBackgroundAlternate = UIColor.white
        public static var CellHighlight = UIColor.lightGray
        public static var CellIconBackground = Background
        public static var CellSeparator = UIColor.lightGray
        public static var CellSeparator2 = CellSeparator
        
        public static var TextFieldStrokeOnPrimaryColor = UIColor.lightGray
        public static var TextFieldStrokeOnLightBackground = UIColor.lightGray
        
        public static var SelectedElement = UIColor.lightGray
        public static var Favourite = UIColor.yellow
        public static var FavouriteBackground = UIColor.lightGray
        
        public static var Error = UIColor.red
        public static var Success = UIColor.green
        
        public static var GeneralStatus = UIColor.green
        public static var PositiveStatus = UIColor.green
        public static var NegativeStatus = UIColor.green
        public static var WarningStatus = UIColor.green
        
        public static var ConnectionBar = UIColor.black
        public static var Connecting = UIColor.yellow
        public static var Connected = UIColor.green
        public static var Disconnected = UIColor.red
        
        public static var SearchBarCancelButton = UIColor.white
        
        // For Widget
        public static let WidgetPrimaryGreen = UIColor("#4DD964")
        public static let WidgetPrimaryRed = UIColor("#FE3B2F")
        
        public static var PageControlTint = UIColor.blue.withAlphaComponent(0.3)
        public static var PageControlSelectedTint = UIColor.blue.withAlphaComponent(0.3)
        
        // Gift Crypto
        public static var GiftCryptoGreen = UIColor("#00C966")
        public static var GiftCryptoPink = UIColor("#FF5AC6")
        public static var GiftCryptoYellow = UIColor("#FFD410")
        public static var GiftCryptoViolet = UIColor("#770CE7")
        
        // For Step Indicator
        public static var CurrentStepIndicator = UIColor.gray
        
        // ------- New Color Styles ------- //
        public static var MainTextPrimary = UIColor.gray
        public static var MainTextSecondary = UIColor.gray
        public static var MainTextTertiary = UIColor.gray
        
        public static var MainBrandPrimary = UIColor.blue
        
        public static var MainNavigationOnNavigation = UIColor.white
        public static var MainNavigationBg = UIColor.lightGray
        
        public static var MainBgSurface = UIColor.gray
        public static var MainBgSurface_Alt = UIColor.gray
        public static var MainBgPrimary = UIColor.lightGray
        public static var MainBgSecondary = UIColor.lightGray
        public static var MainBgTertiary = UIColor.lightGray
        
        public static var BrandTextPrimary = UIColor.black
        public static var BrandTextSecondary = UIColor.black
        public static var BrandTextOnMuted = UIColor.black
        public static var BrandTextOnPrimary = UIColor.black
        public static var BrandBgPrimary = UIColor.lightGray
        public static var BrandBgMuted = UIColor.lightGray
        public static var BrandBgMuted_Border = UIColor.lightGray
        
        public static var SuccessTextPrimary = UIColor.green
        public static var SuccessTextOnMuted = UIColor.green
        public static var SuccessTextOnPrimary = UIColor.green
        public static var SuccessBgPrimary = UIColor.lightGray
        public static var SuccessBgMuted = UIColor.lightGray
        public static var SuccessBgMuted_Border = UIColor.lightGray
        
        public static var DangerTextPrimary = UIColor.red
        public static var DangerTextOnMuted = UIColor.red
        public static var DangerTextOnPrimary = UIColor.red
        public static var DangerBgPrimary = UIColor.lightGray
        public static var DangerBgMuted = UIColor.lightGray
        public static var DangerBgMuted_Border = UIColor.lightGray
        
        public static var WarningTextPrimary = UIColor.yellow
        public static var WarningTextOnMuted = UIColor.yellow
        public static var WarningTextOnPrimary = UIColor.yellow
        public static var WarningBgPrimary = UIColor.lightGray
        public static var WarningBgMuted = UIColor.lightGray
        public static var WarningBgMuted_Border = UIColor.lightGray

        public static var Brand_AltTextPrimary = UIColor.black
        public static var Brand_AltTextSecondary = UIColor.black
        public static var Brand_AltTextOnMuted = UIColor.black
        public static var Brand_AltTextOnPrimary = UIColor.black
        public static var Brand_AltBgPrimary = UIColor.lightGray
        public static var Brand_AltBgMuted = UIColor.lightGray
        public static var Brand_AltBgDisabled = UIColor.lightGray

        public static var AttentionTextPrimary = UIColor.orange
        public static var AttentionTextOnMuted = UIColor.orange
        public static var AttentionTextOnPrimary = UIColor.orange
        public static var AttentionBgPrimary = UIColor.lightGray
        public static var AttentionBgMuted = UIColor.lightGray
        public static var AttentionBgMuted_Border = UIColor.lightGray
        
        public static var MiscHome_Bar = UIColor.white
    }
    
    // MARK: - Fonts
    public struct Font {
        
        public static let MaterialDesignIconsRange = NSRange(location: 0xF001, length: 2302)
        public static func MaterialDesignIconsFontName() -> String {
            return "Material Design Icons"
        }
        public static func MaterialDesignIconsFont(size: CGFloat) -> UIFont   {
            return UIFont(name: MaterialDesignIconsFontName(), size: size)!
        }
        
        public static let FamilyName = "IBM Plex Sans"
        
        public static let BoldName = "IBMPlexSans-Bold"
        public static func Bold(size: CGFloat) -> UIFont   {
            return UIFont(name: BoldName, size: size)!
        }
        public static let ItalicBoldName = "IBMPlexSans-BoldItalic"
        public static func ItalicBold(size: CGFloat) -> UIFont   {
            return UIFont(name: ItalicBoldName, size: size)!
        }
        public static let SemiBoldName = "IBMPlexSans-SmBld"
        public static func SemiBold(size: CGFloat) -> UIFont   {
            return UIFont(name: SemiBoldName, size: size)!
        }
        public static let ItalicSemiBoldName = "IBMPlexSans-SmBldItalic"
        public static func ItalicSemiBold(size: CGFloat) -> UIFont   {
            return UIFont(name: ItalicSemiBoldName, size: size)!
        }
        
        public static let MediumName = "IBMPlexSans-Medm"
        public static func Medium(size: CGFloat) -> UIFont   {
            return UIFont(name: MediumName, size: size)!
        }
        public static let RegularName = "IBMPlexSans"
        public static func Regular(size: CGFloat) -> UIFont   {
            return UIFont(name: RegularName, size: size)!
        }
        
        public enum Style {
            
            case heading1_regular
            case heading1_bold
            case heading1_semibold
            
            case heading2_regular
            case heading2_bold
            case heading2_semibold

            case heading3_regular
            case heading3_bold
            case heading3_semibold

            case heading4_regular
            case heading4_bold
            case heading4_semibold

            case heading5_regular
            case heading5_bold
            case heading5_semibold

            case heading6_regular
            case heading6_bold
            case heading6_semibold

            case large_regular
            case large_bold
            case large_semibold
            case large_medium

            case base_regular
            case base_bold
            case base_semibold
            case base_medium

            case small_regular
            case small_bold
            case small_semibold
            case small_medium

            case xsmall_regular
            case xsmall_bold
            case xsmall_semibold
            case xsmall_medium
        }
    }
    
    // MARK: Other
    public static let ButtonCornerRadius : CGFloat = 6.0
    public static let BottomSheetCornerRadius : CGFloat = 10.0
    public static let LoadingIndicatorLineWidth : CGFloat = 3.0
    public static let LoadingIndicatorAnimationDuration : TimeInterval = 0.8
    public static var KeyboardAppearance: UIKeyboardAppearance = .default
    public static var SelectedTabLineHeight: CGFloat = 4.0
}
