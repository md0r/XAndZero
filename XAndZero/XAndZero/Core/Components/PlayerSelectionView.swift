//
//  PlayerSelectionView.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 02.04.2026.
//

import SwiftUI

private struct Avatars {
     static let humanAvatars: [ImageResource] = [.playerBoy1, .playerBoy2, .playerGirl1, .playerGirl2]
     static let botAvatar: ImageResource = .playerBot1
}

struct PlayerSelectionView: View {
    @Binding var player1: PlayerProfile
    @Binding var player2: PlayerProfile
    
    var body: some View {
        HStack(spacing: 8) {
            PlayerView(profile: $player1, isBotToggleEnabled: false)
            Spacer()
            VersusTextView()
            Spacer()
            PlayerView(profile: $player2, isBotToggleEnabled: true)
        }
        .padding(12)
        .background(Color.appTheme.cellBackground)
        .cornerRadius(.cell)
    }
    
}

private struct VersusTextView: View {
    var body: some View {
        Text("vs")
            .font(.title2)
            .fontWeight(.medium)
            .foregroundStyle(Color.appTheme.alternateAccent)
    }
}

private struct PlayerView: View {
    @Binding var profile: PlayerProfile
    var isBotToggleEnabled: Bool
    
    var body: some View {
        VStack(spacing: 8) {
            CharacterImageArrowSwitcher(profile: $profile)
            CharacterImageView(profile: $profile.wrappedValue)
            HStack(spacing: 5) {
                PlayerNameTextView(profile: $profile.wrappedValue)
                if isBotToggleEnabled {
                    CharacterTypeArrowSwitcher(profile: $profile)
                }
            }
        }
    }
}

private struct CharacterImageArrowSwitcher: View {
    @Binding var profile: PlayerProfile
   
    func switchHumanImage(profile: Binding<PlayerProfile>) {
        guard profile.wrappedValue.type.isHuman else { return }
        if let currentImageIndex = Avatars.humanAvatars.firstIndex(of: profile.wrappedValue.image) {
            profile.wrappedValue.image = Avatars.humanAvatars[(currentImageIndex + 1) % Avatars.humanAvatars.count]
        } else {
            profile.wrappedValue.image = .playerBot1
        }
    }
    
    var body: some View {
        Image(systemName: "arrowtriangle.up.fill")
            .font(.title2)
            .foregroundStyle($profile.wrappedValue.type.isBot ? Color.appTheme.alternateAccent : Color.appTheme.accent )
            .opacity($profile.wrappedValue.type.isBot ? 0.3 : 1)
            .button(.press) {
                withAnimation(.easeInOut) {
                    switchHumanImage(profile: $profile)
                }
            }
    }
}

private struct CharacterImageView: View {
    var profile: PlayerProfile
   
    var body: some View {
        Image(profile.image)
            .resizable()
            .scaledToFit()
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(.overall)
            .overlay(
                RoundedRectangle(cornerRadius: AppCornerRadius.overall.value)
                    .stroke(profile.type.isBot ? Color.appTheme.alternateAccent : Color.appTheme.accent, lineWidth: 0.2)
            )
            .frame(width: 90, height: 90)
    }
}

private struct PlayerNameTextView: View {
    var profile: PlayerProfile
   
    var body: some View {
        Text(profile.name.description)
            .font(.headline)
            .foregroundStyle(profile.type.isBot ? Color.appTheme.alternateAccent : Color.appTheme.accent)
    }
}

private struct CharacterTypeArrowSwitcher: View {
    @Binding var profile: PlayerProfile
   
    func switchPlayerType(profile: Binding<PlayerProfile>) {
        if profile.wrappedValue.type.isHuman {
            profile.wrappedValue = .init(name: .ai, image: Avatars.botAvatar, type: .bot)
        } else {
            profile.wrappedValue = .init(name: .player2, image: Avatars.humanAvatars.first ?? .playerBoy1, type: .human)
        }
    }
    
    var body: some View {
        Image(systemName: "arrowtriangle.up.fill")
            .foregroundStyle($profile.wrappedValue.type.isBot ? Color.appTheme.alternateAccent : Color.appTheme.accent )
            .button(.press) {
                withAnimation(.easeInOut) {
                    switchPlayerType(profile: $profile)
                }
            }
    }
}

