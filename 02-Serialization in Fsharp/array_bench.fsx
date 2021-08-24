type [<Struct>] US0 =
    | US0_0
    | US0_1
    | US0_2
and Mut0 = {mutable l0 : int32}
let rec method3 (v0 : int32, v1 : Mut0) : bool =
    let v2 : int32 = v1.l0
    v2 < v0
and method2 (v0 : (struct (int32 * (US0 [])) [])) : (float32 []) =
    let v1 : (float32 []) = Array.zeroCreate<float32> (33)
    let v2 : int32 = v0.Length
    let v3 : bool = v2 <= 2
    let v4 : bool = v3 = false
    if v4 then
        failwith<unit> "Pickling failure. The given array is too large."
    let v5 : bool = v2 = 0
    if v5 then
        v1.[int 0] <- 1f
    let v6 : Mut0 = {l0 = 0} : Mut0
    while method3(v2, v6) do
        let v8 : int32 = v6.l0
        let struct (v9 : int32, v10 : (US0 [])) = v0.[int v8]
        let v11 : int32 = v8 * 16
        let v12 : int32 = 1 + v11
        let v13 : bool = 0 <= v9
        let v15 : bool =
            if v13 then
                v9 < 3
            else
                false
        let v16 : bool = v15 = false
        if v16 then
            let v17 : string = $"Pickling failure. Int value out of bounds. Got: {v9} Size: {3}"
            failwith<unit> v17
        let v18 : int32 = v12 + v9
        v1.[int v18] <- 1f
        let v19 : int32 = v12 + 3
        let v20 : int32 = v10.Length
        let v21 : bool = v20 <= 4
        let v22 : bool = v21 = false
        if v22 then
            failwith<unit> "Pickling failure. The given array is too large."
        let v23 : bool = v20 = 0
        if v23 then
            v1.[int v19] <- 1f
        let v24 : int32 = v19 + 1
        let v25 : Mut0 = {l0 = 0} : Mut0
        while method3(v20, v25) do
            let v27 : int32 = v25.l0
            let v28 : US0 = v10.[int v27]
            let v29 : int32 = v27 * 3
            let v30 : int32 = v24 + v29
            match v28 with
            | US0_0 -> (* Call *)
                v1.[int v30] <- 1f
            | US0_1 -> (* Fold *)
                let v31 : int32 = v30 + 1
                v1.[int v31] <- 1f
            | US0_2 -> (* Raise *)
                let v32 : int32 = v30 + 2
                v1.[int v32] <- 1f
            let v33 : int32 = v27 + 1
            v25.l0 <- v33
        let v34 : int32 = v8 + 1
        v6.l0 <- v34
    v1
and method1 (v0 : (struct (int32 * (US0 [])) []), v1 : int32) : unit =
    let v2 : bool = v1 < 100000
    if v2 then
        let v3 : int32 = v1 + 1
        let v4 : (float32 []) = method2(v0)
        method1(v0, v3)
and method0 (v0 : (struct (int32 * (US0 [])) []), v1 : int32) : unit =
    let v2 : bool = v1 < 100
    if v2 then
        let v3 : int32 = v1 + 1
        let v4 : int32 = 0
        method1(v0, v4)
        method0(v0, v3)
let v0 : US0 = US0_0
let v1 : US0 = US0_2
let v2 : US0 = US0_2
let v3 : US0 = US0_0
let v4 : (US0 []) = [|v0; v1; v2; v3|]
let v5 : US0 = US0_0
let v6 : (US0 []) = [|v5|]
let v7 : (struct (int32 * (US0 [])) []) = [|struct (0, v4); struct (2, v6)|]
let v8 : int32 = 0
method0(v7, v8)
let v9 : System.Diagnostics.Stopwatch = new System.Diagnostics.Stopwatch()
v9.Start()
let v10 : int32 = 0
method1(v7, v10)
v9.Stop()
printfn "%f" (v9.Elapsed.TotalSeconds)
