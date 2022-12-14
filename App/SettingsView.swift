//
//  SettingsView.swift
//  Fructus
//
//  Created by Bertuğ Horoz on 22.11.2022.
//

import SwiftUI

struct SettingsView: View {
    // PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    @AppStorage("isOnboarding") var isOnboarding : Bool = false
    // BODY
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    // SECTION 1
                    GroupBox(label:
                                SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")) {
                        Divider().padding(.vertical , 5)
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(19)
                            Text("Most fruits are naturally low in fat, sodium, and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins and much more.")
                                .font(.footnote)
                        } // : HSTACK
                    }
                    // SECTION 2
                    GroupBox(label: SettingsLabelView(labelText: "customization", labelImage: "paintbrush"))
                    {
                        Divider().padding(.vertical, 4)
                        Text("If you wish, you can restart the application by toggle the swtich in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.secondary)
                            }
                        }
                        .padding()
                        .background(Color(UIColor.tertiarySystemBackground).clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous)))
                    }
                    // SECTION 3
                    GroupBox(label : SettingsLabelView(labelText: "Application", labelImage: "apps.iphone"))
                    {
                        SettingsRowView(name: "Developer" , content: "Ber2")
                        SettingsRowView(name: "Designer" , content: "Bertuğ Horoz")
                        SettingsRowView(name: "Compatibility", content: "IOS 16")
                        SettingsRowView(name: "Website", linkLAbel: "Myra Studios", linkDestination: "myrastudios.co")
                        SettingsRowView(name: "Twitter", linkLAbel: "@Bertughoroz", linkDestination: "twitter.com/Bertughoroz")
                        SettingsRowView(name: "SwiftUI", content: "2.0")
                        SettingsRowView(name: "Version" , content: "1.1.0")
                    }
                } // : VSTACK
                .navigationBarTitle(Text("Settings"), displayMode: .large)
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                }
                )
                .padding()
            }
        } // : NAVIGATION
    }
}
// PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
