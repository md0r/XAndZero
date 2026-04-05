//
//  PlayerInGameView.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 05.04.2026.
//

import SwiftUI

enum Orientation {
    case left
    case right
}

struct PlayerInGameView: View {
    
    let player: PlayerProfile
    let orientation: Orientation
    let isCurrentPlayer: Bool
    let winsCount: Int
    
    @State private var animateArrows = false
    
    func updateAnimateArrows(isCurrentPlayer: Bool) {
        if isCurrentPlayer {
            animateArrows = true
        } else {
            animateArrows = false
        }
    }
    
    var body: some View {
        VStack(spacing: 2) {
            ArrowIndicatorView(isCurrentPlayer: isCurrentPlayer, animateArrows: $animateArrows)
            HStack(spacing: 8) {
                switch orientation {
                case .left:
                    ImageView(player: player)
                    DetailsView(player: player, orientation: orientation, winsCount: winsCount)
                case .right:
                    DetailsView(player: player, orientation: orientation, winsCount: winsCount)
                    ImageView(player: player)
                }
            }
            .padding()
            .background(Color.appTheme.cellBackground)
            .cornerRadius(.cell)
            .overlay(RoundedRectangle(cornerRadius: AppCornerRadius.overall.value).stroke(Color.appTheme.accent.opacity(isCurrentPlayer ? 1 : 0), lineWidth: 2))
        }
        .onAppear {
            updateAnimateArrows(isCurrentPlayer: isCurrentPlayer)
        }
        .onChange(of: isCurrentPlayer) { _, newValue in
            updateAnimateArrows(isCurrentPlayer: newValue)
        }
    }
}

private struct ArrowIndicatorView: View {
    let isCurrentPlayer: Bool
    @Binding var animateArrows: Bool
    
    var body: some View {
        Group {
            Image(systemName: "chevron.down")
            Image(systemName: "chevron.down")
        }
        .fontWeight(.semibold)
        .foregroundStyle(Color.appTheme.accent)
        .opacity(isCurrentPlayer ? 1 : 0)
        .scaleEffect(isCurrentPlayer ? 1.1 : 0.9)
        .animation(isCurrentPlayer ? .easeInOut(duration: 0.6).repeatForever(autoreverses: true) : .default, value: animateArrows)
    }
}

private struct DetailsView: View {
    let player: PlayerProfile
    let orientation: Orientation
    let winsCount: Int
    var body: some View {
        VStack(alignment: orientation == .left ? .leading : .trailing, spacing: 8) {
            NameView(player: player, orientation: orientation)
            HStack(spacing: 12) {
                switch orientation {
                case .left:
                    CurrentSymbolView(orientation: orientation)
                    WinsCountView(winsCount: winsCount)
                case .right:
                    WinsCountView(winsCount: winsCount)
                    CurrentSymbolView(orientation: orientation)
                }
            }
            .font(.title2)
        }
    }
}

private struct ImageView: View {
    let player: PlayerProfile
    var body: some View {
        Image(player.image)
            .resizable()
            .scaledToFit()
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(.overall)
            .overlay(RoundedRectangle(cornerRadius: AppCornerRadius.overall.value).stroke(player.type.isBot ? Color.appTheme.alternateAccent : Color.appTheme.accent, lineWidth: 0.2))
            .frame(width: 60, height:60)
        
        
    }
}

private struct NameView: View {
    let player: PlayerProfile
    let orientation: Orientation
    var body: some View {
        ZStack(alignment: orientation == .left ? .leading : .trailing) {
            Text("Player 12")
                .font(.headline)
                .opacity(0)
            Text(player.name.description)
                .font(.headline)
                .foregroundStyle(player.type.isBot ? Color.appTheme.alternateAccent : Color.appTheme.accent)
        }
    }
}

private struct CurrentSymbolView: View {
    let orientation: Orientation
    var body: some View {
        Image(systemName: orientation == .left ? "xmark" : "circle")
            .fontWeight(.bold)
            .foregroundStyle(orientation == .left ? Color.appTheme.accent : Color.appTheme.alternateAccent)
    }
}

private struct WinsCountView: View {
    let winsCount: Int
    var body: some View {
        Text("\(winsCount)")
            .foregroundStyle(Color.appTheme.success)
            .fontWeight(.semibold)
            .underline()
    }
}
