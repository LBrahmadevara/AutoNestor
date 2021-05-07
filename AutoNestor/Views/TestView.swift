//
//  TestView.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 5/6/21.
//

import SwiftUI

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

class Expenses2: ObservableObject {
    @Published var items: Array = ["as", "asd", "asdw"]
}

struct TestView: View {
    @ObservedObject var expenses = Expenses()
    @ObservedObject var expenses2 = Expenses2()
    var body: some View {
        NavigationView {
//            List {
            ForEach(0..<expenses2.items.count, id: \.self) { item in
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                        Text("\(expenses2.items[item])")
                        Button(action: {
                            removeItems(at: item)
                        }, label: {
                            /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
                        })
                    })
                }
//                .onDelete(perform: removeItems)
//            }
            .navigationBarTitle("iExpense")
            .navigationBarItems(trailing:
                Button(action: {
                    let expense = ExpenseItem(name: "Test", type: "Personal", amount: 5)
                    self.expenses.items.append(expense)
                }) {
                    Image(systemName: "plus")
                }
            )
        }
    }
    func removeItems(at offsets: Int) {
//        expenses2.items.remove(atOffsets: offsets)
        expenses2.items.remove(at: offsets)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
