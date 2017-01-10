//
//  NSImage+AssetCatalog.swift
//  Clipy
//
//  Created by xuneng 
//  Copyright © 2015年 Shunsuke Furubayashi. All rights reserved.
//

import Foundation
import Cocoa

extension NSImage {

    // MARK: - Enum Value
    enum AssetIdentifier: String {
        // Icons
        case IconFolder = "icon_folder"
        case IconText   = "icon_text"

        // MenuIcons
        case MenuBlack = "statusbar_menu_black"
        case MenuWhite = "statusbar_menu_white"

        // Snippets Editor
        case SnippetsIconFolder         = "snippets_icon_folder_blue"
        case SnippetsIconFolderWhite    = "snippets_icon_folder_white"

        // Preferences
        case GeneralOff     = "pref_general"
        case MenuOff        = "pref_menu"
        case TypeOff        = "pref_type"
        case ExcludedOff    = "pref_excluded"
        case ShortcutsOff   = "pref_shortcut"
        case UpdatesOff     = "pref_update"
        case BetaOff        = "pref_beta"

        case GeneralOn      = "pref_general_on"
        case MenuOn         = "pref_menu_on"
        case TypeOn         = "pref_type_on"
        case ExcludedOn     = "pref_excluded_on"
        case ShortcutsOn    = "pref_shortcut_on"
        case UpdatesOn      = "pref_update_on"
        case BetaOn         = "pref_beta_on"
    }

    // MARK: - Initialize
    convenience init(assetIdentifier: AssetIdentifier) {
        self.init(named: assetIdentifier.rawValue)!
    }

}
