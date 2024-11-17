![RepoIcon](https://i.sstatic.net/8kiqWITK.png?s=256)

Hide any view from screen-shot/recording with a single line of code:

```
MySensitiveView()
    .captureGuard()
```

---

##### SPM Install
Add the package as a dependency:
```
dependencies: [
    .package(url: "https://github.com/MojtabaHs/swiftui-capture-guard", from: "1.0.0"),
]
```
Then add the product from the package to your target:
```
.product(name: "CaptureGuard", package: "swiftui-capture-guard")
```
