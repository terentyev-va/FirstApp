//
//  RealmManager.swift
//  FirstApp
//
//  Created by Вячеслав Терентьев on 31.05.2022.
//

import Foundation
import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    private init() {}
    
    let localRealm = try! Realm()
    
    func saveWorkoutModel(model: WorkoutModel) {  // Метод сохранения модели в базу данных
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteWorkoutModel(model: WorkoutModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    
    func updateSetsRepsWorkoutModel(model: WorkoutModel, sets: Int, reps: Int) {
        try! localRealm.write {
            model.workoutSets = sets
            model.workoutReps = reps
        }
    }
    
    func updateStatusWorkoutModel(model: WorkoutModel) {
        try! localRealm.write {
            model.workoutStatus
        }
    }
    
    func updateSetsTimerWorkoutModel(model: WorkoutModel, sets: Int, timer: Int) {
        try! localRealm.write {
            model.workoutSets = sets
            model.workoutTimer = timer
        }
    }
    
}
