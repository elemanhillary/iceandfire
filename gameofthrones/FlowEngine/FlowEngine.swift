//
//  FlowEngine.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import Foundation

class FlowEngine<Flow, FlowPerformer> where FlowPerformer: FlowPerformerProtocol,
                                            Flow: FlowProtocol,
                                            Flow.FlowStep == FlowPerformer.FlowStep,
                                            Flow.FlowState == FlowPerformer.FlowState {
    let flowPerformer: FlowPerformer
    let flow: Flow
    
    init(
        flowPerformer: FlowPerformer,
        flow: Flow
    ) {
        self.flowPerformer = flowPerformer
        self.flow = flow
    }
    
    func begin(initialState state: Flow.FlowState) {
        guard let step = flow.nextStep(state: state) else { return }
        execute(step: step, state: state)
    }
    
    private func execute(step: Flow.FlowStep, state: Flow.FlowState) {
        flowPerformer.perform(step: step) { action in
            state.update(with: action)
            guard let step = self.flow.nextStep(state: state) else { return }
            self.execute(step: step, state: state)
        }
    }
}
