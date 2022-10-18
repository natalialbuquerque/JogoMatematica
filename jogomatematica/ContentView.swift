import SwiftUI

struct ContentView: View {
    //    @State private var offset = CGSize.zero
    //    @State private var dragOffSet = CGSize.zero
    @State private var rectPosition = CGPoint(x: 50, y: 500)
    @State private var isEnded = false
    @State var scale: CGFloat = 1
    
    func apertouBotao(){
        print("apertou botao")
    }
    var body: some View {
        ZStack {
            Image("BlueBrackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack{
                ZStack{
                    Image("bluerectangle")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: 414, height: 190)
                    
                    HStack{
                        Button(action: {
                            apertouBotao()
                        }) {
                            Image("botaohome")
                        }
                        
                        Image("goal2")
                        
                        Button(action: {
                            apertouBotao()
                        }) {
                            Image("botaopausa")
                        }
                    }
                }
                
                Image("crab")
                    .resizable()
                    .frame(width: 164.71, height: 100.0)
                    .scaledToFit()
                //                .offset(x: offset.width + dragOffSet.width)
                    .position(rectPosition)
                    .gesture(
                        DragGesture()
                            .onChanged{ value in
                                self.rectPosition = CGPoint(x: value.location.x, y: 500)
                            }
                            .onEnded{ value in
                                self.isEnded = value.location.x < 120
                            }
                    )
            }
        }
        
    }
    
    func screenBounds() -> CGFloat {
        let max = UIScreen.main.bounds.width
        //        let currentBound = abs(offset.width)
        return  max
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
