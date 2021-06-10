//
//  SettingsView.swift
//  ToDo-iOS
//
//  Created by Azamat Ochilov on 2021/06/09.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    
    // MARK - BODY
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 0) {
                // MARK: - FORM
                
                Form {
                    // MARK: - SECTION 3
                    
                    Section(header: Text("Follow us on social media")) {
                        FormRowLinkView(icon: "globe", color: Color.pink, text: "LinkedIn", link: "https://linkedin.com/in/SudoAzek")
                        FormRowLinkView(icon: "link", color: Color.blue, text: "GitHub", link: "https://github.com/SudoAzek")
                        
                    } //: SECTION 3
                    
                    // MARK: - SECTION 4
                    Section(header: Text("About the application")) {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "ToDo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "Azamat Ochilov")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "MezonWorks")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.1")
                    } //: SECTION 4
                } //: FORM
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                // MAKR: - FOOTER
                
                Text("Copyright © All rights reserved.\n♡ MezonWorks")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(.secondary)
                
            } //: VSTACK
            .navigationBarItems(trailing:
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                })
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color("ColorBackground")).edgesIgnoringSafeArea(.all)
        } //: NAVIGATION
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
