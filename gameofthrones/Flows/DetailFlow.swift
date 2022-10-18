//
//  DetailFlow.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import Foundation

class DetailFlow: FlowProtocol {
    func nextStep(state: FlowState) -> FlowStep? {
        guard state.screenShow else { return .showScreen(houseUrl: state.houseUrl) }
        return nil
    }
    
    enum FlowStep: FlowStepProtocol, Equatable {
        case showScreen(houseUrl: String)
    }
    
    class FlowState: FlowStateProtocol {
        let houseUrl: String
        var screenShow: Bool = false
        
        init(houseUrl: String) {
            self.houseUrl = houseUrl
        }
        
        enum UpdateAction {
            case screenShow
        }
        
        func update(with action: UpdateAction) {
            switch action {
            case .screenShow:
                self.screenShow = true
            }
        }
    }
}
