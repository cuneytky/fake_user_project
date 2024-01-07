package com.cydeo.fakeuserapp.controller;

import com.cydeo.fakeuserapp.service.FakeUserService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1")
public class FakeUserController {

    private final FakeUserService fakeUserService;

    public FakeUserController(FakeUserService fakeUserService) {
        this.fakeUserService = fakeUserService;
    }

    @GetMapping("/lotr")
    public ResponseEntity<String> getLotrCharacter() {
        return ResponseEntity.ok(fakeUserService.getLotrCharacter());
    }

}
