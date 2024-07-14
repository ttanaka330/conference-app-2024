import Dependencies

extension TimetableClient: TestDependencyKey {
    public static let previewValue: Self = Self()

    public static let testValue: Self = Self(
        streamTimetable: unimplemented("TimetableClient.streamTimetable"),
        streamTimetableItemWithFavorite: unimplemented("TimetableClient.streamTimetableItemWithFavorite"),
        toggleBookmark: unimplemented("TimetableClient.toggleBookmark")
    )
}

extension StaffClient: TestDependencyKey {
    public static let previewValue: Self = Self()
    public static let testValue: Self = Self(streamStaffs: unimplemented("StaffClient.streamStaffs"))
}

extension SponsorsClient: TestDependencyKey {
    public static let previewValue: Self = Self()
    public static let testValue: Self = Self(streamSponsors: unimplemented("SponsorsClient.streamSponsors"))
}
