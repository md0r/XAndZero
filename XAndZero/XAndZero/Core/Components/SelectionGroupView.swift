//
//  SelectionGroupView.swift
//  XAndZero
//
//  Created by Mihai Dorhan on 04.04.2026.
//

import SwiftUI

struct SelectionGroupView<Option: Hashable & CustomStringConvertible>: View {
    
    let title: String
    let options: [Option]
    @Binding var selectedOption: Option
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            TitleView(title: title)
            OptionsView(options: options, selectedOption: $selectedOption)
        }
    }
}

private struct TitleView: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.headline)
            .foregroundStyle(Color.appTheme.info)
    }
}

private struct OptionsView<Option: Hashable & CustomStringConvertible>: View {
    var options: [Option]
    @Binding var selectedOption: Option
    
    func selectOption(_ option: Option) {
        withAnimation(.spring) {
            selectedOption = option
        }
    }
        
    var body: some View {
        HStack(spacing: 8) {
            ForEach(options, id: \.self) { option in
                OptionRow(option: option, selectedOption: $selectedOption)
                    .button(.press) {
                        selectOption(option)
                    }
            }
        }
    }
}

private struct OptionRow<Option: Hashable & CustomStringConvertible>: View {
    
    var option: Option
    @Binding var selectedOption: Option
    
    var body: some View {
        Text(option.description)
            .fontWeight(.medium)
            .foregroundStyle(selectedOption == option ? Color.appTheme.accentContrastText : Color.appTheme.text)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .background(selectedOption == option ? Color.appTheme.info.opacity(0.6) : Color.appTheme.info.opacity(0.2))
            .cornerRadius(.button)
            .shadow(.light)
    }
    
}
