//
//  NYStoriesTests.swift
//  NYStoriesTests
//
//  Created by Maksim Chulkov on 19.05.2022.
//

import XCTest
@testable import NYStories
class NYStoriesTests: XCTestCase {
    
    var storiesWorker = StoryWorker()
    
    func testStoryCodable() {
        
        // properties to match
        let storyTitle = "Poor Countries Face a Mounting Catastrophe Fueled by Inflation and Debt"
        let storyDescription = "Russia’s war in Ukraine is combining with a global tightening of credit and an economic slowdown in China to sow misery in low- and middle-income countries."
        let storyAuthor = "By Peter S. Goodman, Ruth Maclean, Salman Masood, Elif Ince, Flávia Milhorance, Muktita Suhartono and Brenda Kiven"
        let storyURL = URL(string: "https://www.nytimes.com/2022/05/17/business/inflation-developing-economies.html")
        let mediaURL =  URL(string: "https://static01.nyt.com/images/2022/05/16/business/00global-econ-1/merlin_206767902_f6784618-f4c7-42a5-abff-7c8195d7c8ef-superJumbo.jpg")
        
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: "Story", withExtension: "json") else {
            XCTFail("Missing File: Story.json")
            return
        }
        
        do {
            let responseData = try Data(contentsOf: url)
            let story = try JSONDecoder().decode(BaseResult<Story>.self, from: responseData)
            if let storyResult = story.results?.first {
                XCTAssertEqual(storyResult.title, storyTitle)
                XCTAssertEqual(storyResult.description, storyDescription)
                XCTAssertEqual(storyResult.author, storyAuthor)
                XCTAssertEqual(storyResult.url, storyURL)
                
                if let firstMedia = storyResult.images?.first {
                    XCTAssertEqual(firstMedia.imageURL, mediaURL)
                } else {
                    XCTFail("Error decoding media")
                }
            } else {
                XCTFail("Error decoding results")
            }
        } catch {
            XCTFail("Error decoding Story json into object: \(error)")
        }
    }
    
    func testStoriesAPIReachable() {

        let ex = expectation(description: "Expecting a response from Stories API")
        
        NetworkAdapter.shared.request(AppConst.topStories) {  (response : BaseResult<Story>) in
            print("Stories request successfully")
            ex.fulfill()
        } failure: {
            print("Stories request failed")
        }
        
        waitForExpectations(timeout: 15) { (error) in
            if let error = error {
                XCTFail("Timeout error: \(error)")
            }
        }
    }


    //Test that the API returns a valid result
    func testStoriesAPI() {

        let ex = expectation(description: "Expecting a success return from the api")
        
        storiesWorker.getStoriesList { stories in
            if stories.isEmpty {
                print("Object is empty")
            } else {
                ex.fulfill()
            }
        }
        
        waitForExpectations(timeout: 15) { (error) in
            if let error = error {
                XCTFail("Timeout error: \(error)")
            }
        }
    }
}
