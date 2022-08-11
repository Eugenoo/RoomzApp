//
//  ContentView.swift
//  RoomzApp
//
//  Created by Filip Tuliszkiewicz on 11/08/2022.
//

import SwiftUI

struct Room: Hashable, Codable {
    let id: IntegerLiteralType
    let guest_id: IntegerLiteralType
    let room_id: IntegerLiteralType
    let seaspm_id: IntegerLiteralType
    let has_breakfast: IntegerLiteralType
    let reservation_start: Date
    let reservation_end: Date
    let created_at: Date
    let updated_at: Date
}

class ViewModel: ObservableObject {
    @Published var rooms: [Room] = []
    
    func fetch(){
        guard let url = URL(string:
            "localhost:8000/api/reservations"
        ) else {
            
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, , error in
            guard let data = data, error == nil else {
                return
            }
            
            //Convert to JSON
            do {
                let rooms = try JSONDecoder().decode([Room]).self, from: data)
                DispatchQueue.main.async {
                    self?.rooms = rooms
                }
            }
            catch
            {
                print(error)
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                
            }
            .navigationTitle("Roomz")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
