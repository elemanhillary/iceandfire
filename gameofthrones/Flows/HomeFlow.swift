//
//  DetailsFlow.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import Foundation

class HomeFlow: FlowProtocol {
    func nextStep(state: FlowState) -> FlowStep? {
        guard state.screenShow else { return .showScreen(apiUrl: state.apiUrl) }
        return nil
    }
    
    enum FlowStep: FlowStepProtocol, Equatable {
        case showScreen(apiUrl: String)
    }
    
    class FlowState: FlowStateProtocol {
        let apiUrl: String
        var screenShow: Bool = false
        
        init(apiUrl: String) {
            self.apiUrl = apiUrl
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
