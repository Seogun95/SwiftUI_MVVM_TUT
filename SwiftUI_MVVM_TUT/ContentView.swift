//
//  ContentView.swift
//  SwiftUI_MVVM_TUT
//
//  Created by 김선중 on 2021/02/17.
//

import SwiftUI


//Models
struct Person {
    var name: String
    var birthday: Date
}
//ViewMdoel
class ContentViewModel: ObservableObject {
    @Published var seogun  = Person(name: "서근", birthday: Date())
    
    var name: String {
        seogun.name
    }
    var age: String {
        
        //Date를 -> 나이로 변환
        return "27"
    }
    //이름변경 함수 생성
    func changeName(_ name: String) {
        seogun.name = name
    }
}



//Views
struct ContentView: View {
    //ViewModel을 가져온다
    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        
        VStack {
            Text(viewModel.name)
                .padding()
            Text(viewModel.age)
                .padding()
            Button("이름변경") {
                //이름을 "포뇨"로 변경
                viewModel.changeName("포뇨")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
