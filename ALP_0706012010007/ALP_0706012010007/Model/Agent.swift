//
//  Agent.swift
//  ALP_0706012010007
//
//  Created by MacBook Pro on 26/05/22.
//

import Foundation

struct Agent: Hashable, Codable {
    var uuid, displayName, agentDescription, developerName: String
    var characterTags: [String]?
    var displayIcon, displayIconSmall: String
    var bustPortrait, fullPortrait, fullPortraitV2: String?
    var killfeedPortrait: String
    var background: String?
    var backgroundGradientColors: [String]?
    var assetPath: String
    var isFullPortraitRightFacing, isPlayableCharacter, isAvailableForTest, isBaseContent: Bool
    var role: Role?
    var abilities: [Ability]
    var voiceLine: VoiceLine

    enum CodingKeys: String, CodingKey {
        case uuid, displayName
        case agentDescription = "description"
        case developerName, characterTags, displayIcon, displayIconSmall, bustPortrait, fullPortrait, fullPortraitV2, killfeedPortrait, background, backgroundGradientColors, assetPath, isFullPortraitRightFacing, isPlayableCharacter, isAvailableForTest, isBaseContent, role, abilities, voiceLine
    }
}

struct Ability: Hashable, Codable {
    var slot: Slot
    var displayName, abilityDescription: String
    var displayIcon: String?

    enum CodingKeys: String, CodingKey {
        case slot, displayName
        case abilityDescription = "description"
        case displayIcon
    }
}

enum Slot: String, Hashable, Codable {
    case ability1 = "Ability1"
    case ability2 = "Ability2"
    case grenade = "Grenade"
    case passive = "Passive"
    case ultimate = "Ultimate"
}

struct Role: Hashable, Codable {
    var uuid: String
    var displayName: DisplayName
    var roleDescription: String
    var displayIcon: String
    var assetPath: String

    enum CodingKeys: String, CodingKey {
        case uuid, displayName
        case roleDescription = "description"
        case displayIcon, assetPath
    }
}

enum DisplayName: String, Hashable, Codable {
    case controller = "Controller"
    case duelist = "Duelist"
    case initiator = "Initiator"
    case sentinel = "Sentinel"
}

struct VoiceLine: Hashable, Codable {
    var minDuration, maxDuration: Double
    var mediaList: [MediaList]
}

struct MediaList: Hashable, Codable {
    var id: Int
    var wwise: String
    var wave: String
}
