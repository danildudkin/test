import Foundation
import RealmSwift

var tableDeals: [String] = []
var tableTime: [Int] = []
var tableDone: [Bool] = []

class Deals: Object {
    @objc dynamic var name = ""
}

class Time: Object {
    @objc dynamic var timename = 0
}

class Done: Object {
    @objc dynamic var done = false
}

class taskB{
    static let shared = taskB()

    private let realm = try! Realm()
    
    
    func addItem(_ nameItem: String,_ timeItem: Int,_ n: Int){
        let deals = Deals()
        let time = Time()
        let done = Done()
        deals.name = nameItem
        time.timename = timeItem
        done.done = false
        
        if n == 0 {
        try! realm.write {
            realm.add(deals)
            realm.add(time)
            realm.add(done)
        }
        }
        
        let allTimes = realm.objects(Time.self)
        let allDeals = realm.objects(Deals.self)
        let allDone = realm.objects(Done.self)
        
        try! realm.write{
            if n == 1 {
            for deals in allDeals {
                tableDeals.append(deals.name)
                }
            for time in allTimes {
                tableTime.append(time.timename)
                }
            for done in allDone {
                tableDone.append(done.done)
                }
            } else {
                tableDeals.append(deals.name)
                tableTime.append(time.timename)
                tableDone.append(done.done)
            }
        }
    
    }

    func changeState(_ item: Int) {
        let delDone = realm.objects(Done.self)
        try! realm.write{
            tableDone[item] = !(tableDone[item])
            realm.delete(delDone)
        }
        for (i, _) in tableDone.enumerated() {
            let done = Done()
            done.done = tableDone[i]
            try! realm.write {
            realm.add(done)
            }
        }
        
//        return tableDone[item]
    }
    
    func removeItem(at index: Int){
        let delTime = realm.objects(Time.self)
        let delDeals = realm.objects(Deals.self)
        let delDone = realm.objects(Done.self)
        
        try! realm.write{
            tableTime.remove(at: index)
            realm.delete(delTime)
            tableDeals.remove(at: index)
            realm.delete(delDeals)
            tableDone.remove(at: index)
            realm.delete(delDone)
        }
        for (i, _) in tableTime.enumerated() {
            let time = Time()
            time.timename = tableTime[i]
            try! realm.write {
                    realm.add(time)
            }
        }
        for (i, _) in tableDeals.enumerated() {
            let deals = Deals()
            deals.name = tableDeals[i]
            try! realm.write {
                    realm.add(deals)
                }
        }
        for (i, _) in tableDone.enumerated() {
            let done = Done()
            done.done = tableDone[i]
            try! realm.write {
                    realm.add(done)
                }
        }
    }
    
    func udalit() {
        let delTime = realm.objects(Time.self)
        let delDeals = realm.objects(Deals.self)
        let delDone = realm.objects(Done.self)
        try! realm.write {
                realm.delete(delTime)
                realm.delete(delDeals)
                realm.delete(delDone)
        }
    }
}
