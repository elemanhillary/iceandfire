//
//  FlowEngineProtocols.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import Foundation
import UIKit

protocol FlowStateProtocol {
    associatedtype UpdateAction
    func update(with action: UpdateAction)
}

protocol FlowStepProtocol {}

protocol FlowPerformerProtocol {
    associatedtype FlowState: FlowStateProtocol
    associatedtype FlowStep: FlowStepProtocol
    
    func perform(step: FlowStep, completion: @escaping (FlowState.UpdateAction) -> Void)
}

protocol FlowProtocol {
    associatedtype FlowState: FlowStateProtocol
    associatedtype FlowStep: FlowStepProtocol
    
    func nextStep(state: FlowState) -> FlowStep?
}

protocol FlowRunnerProtocol {
    func runDetailFlow(navigationController: UINavigationController, houseUrl: String)
}
