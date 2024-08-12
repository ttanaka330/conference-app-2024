import Foundation
import CommonComponents
import shared

public enum DayTab: String, CaseIterable, Identifiable, Sendable {
    public var id : RawValue { rawValue }
    
    case workshopDay = "WorkshopDay"
    case day1 = "Day 1"
    case day2 = "Day 2"
}

public enum TimetableMode {
    case list
    case grid
}

public struct TimetableTimeGroupItems: Identifiable, Equatable, Hashable {
    public var id: String {
        UUID().uuidString
    }

    public let startsTimeString: String
    public let endsTimeString: String
    public var items: [shared.TimetableItemWithFavorite]

    public init(startsTimeString: String, endsTimeString: String, items: [shared.TimetableItemWithFavorite]) {
        self.startsTimeString = startsTimeString
        self.endsTimeString = endsTimeString
        self.items = items
    }
    
    func getItemForRoom(forRoom: RoomType) -> TimetableItemWithFavorite? {
        items.filter {
            $0.timetableItem.room.type == forRoom
        }.first
    }
    
    func getCellForRoom(room: RoomType, onTap: @escaping (TimetableItem) -> Void) -> TimetableGridCard {
        return if let cell = getItemForRoom(forRoom: room) {
            TimetableGridCard(timetableItem: cell.timetableItem) { timetableItem in
                onTap(timetableItem)
            }
        } else {
            TimetableGridCard(timetableItem: nil) { _ in
                // Does nothing
            }
        }
    }
}

// This exists only for previews now.
struct SampleData {
    let workdayResults = [
        TimetableTimeGroupItems(startsTimeString:"12:00", endsTimeString:"13:00", items: [
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false),
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false),
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false)]),
        TimetableTimeGroupItems(startsTimeString:"13:00", endsTimeString:"14:00", items: [
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false),
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false),
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false)]),
    ]
    
    let day1Results = [
        TimetableTimeGroupItems(startsTimeString:"12:00", endsTimeString:"13:00", items: [
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false),
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false),
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false)]),
        TimetableTimeGroupItems(startsTimeString:"13:00", endsTimeString:"14:00", items: [
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false),
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false),
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false)]),
    ]
    
    let day2Results = [
        TimetableTimeGroupItems(startsTimeString:"12:00", endsTimeString:"13:00", items: [
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false),
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false),
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false)]),
        TimetableTimeGroupItems(startsTimeString:"13:00", endsTimeString:"14:00", items: [
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false),
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false),
            TimetableItemWithFavorite(timetableItem: TimetableItem.Session.companion.fake(), isFavorited: false)]),
    ]
}
