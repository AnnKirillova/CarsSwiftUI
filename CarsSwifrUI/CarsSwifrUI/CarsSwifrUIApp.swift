//
//  CarsSwifrUIApp.swift
//  CarsSwifrUI
//
//  Created by Ann on 06.09.2021.
//

import SwiftUI

@propertyWrapper
struct MyAppStorage<Value> {
    let store: UserDefaults
    let key: String
    
    init(wrappedValue: Value, _ key: String, store: UserDefaults = .standard) {
        self.key = key
        self.store = store
        self.wrappedValue = wrappedValue
    }
    
    var wrappedValue: Value? {
        get {
            return store.value(forKey: key) as? Value
        }
        set {
            store.set(newValue, forKey: key)
            store.synchronize()
        }
    }
}


@main
struct CarsSwifrUIApp: App {
    @ObservedObject var user = User()
    @State var name: String = ""
    @State var surename: String = ""
    
    var body: some Scene {
        WindowGroup {
            VStack {
                
                HStack {
                    TextField(name, text: $name)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        self.user.updateName(self.name)
                        
                    } label: {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.green)
                    }
                }
                Text(user.name)
                HStack {
                    TextField(surename, text: $surename)
                        .textFieldStyle(.roundedBorder)
                    Button {
                        self.user.updateSureName(self.surename)
                    } label: {
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.green)
                    }

                }
                Text(user.sureName)
            }
            .padding()
        }
    }
}

class User: ObservableObject {
    
//    @Modified(.uppercased)
    @AppStorage("user-name")
     var name = ""
    
    func updateName(_ newName: String) {
        name = newName
    }
    
    @AppStorage("user-surename")
    var sureName = ""
    func updateSureName(_ newSureName: String) {
        sureName = newSureName
    }
}

@propertyWrapper
struct UserName {
    var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.capitalized
        }
    }
    
    init(wrappedValue: String) {
        let modifiedValue = wrappedValue.capitalized
        
        self.wrappedValue = modifiedValue.appending("*")
            .replacingOccurrences(of: "A", with: "@")
            .replacingOccurrences(of: "a", with: "@")
    }
}



@propertyWrapper
struct Capitalised {
    var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.capitalized
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}



@propertyWrapper
struct Uppercased {
    var wrappedValue: String {
        didSet {
            wrappedValue = wrappedValue.uppercased()
        }
    }
    
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.uppercased()
    }
}
