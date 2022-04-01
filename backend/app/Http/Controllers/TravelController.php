<?php

namespace App\Http\Controllers;

use App\Models\Travel;
use Illuminate\Http\Request;

class TravelController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $travels = Travel::get();

        return response()->json(['status' => true, 'data' => $travels]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $attr = $request->validate([
            'nama' => ['required'],
            'deskripsi' => ['required'],
            'harga_tiket' => ['required'],
            'jam_operasional' => ['required'],
            'image_url' => ['required'],
            'kota' => ['required'],
        ]);

        $travel = Travel::create($attr);

        return response()->json(['status' => true, 'data' => $travel]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Travel  $travel
     * @return \Illuminate\Http\Response
     */
    public function show(Travel $travel)
    {
        return response()->json(['status' => true, 'data' => $travel]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Travel  $travel
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Travel $travel)
    {
        $attr = $request->validate([
            'nama' => ['required'],
            'deskripsi' => ['required'],
            'harga_tiket' => ['required'],
            'jam_operasional' => ['required'],
            'image_url' => ['required'],
            'kota' => ['required'],
        ]);

        $travel->update($attr);

        return response()->json(['status' => true, 'data' => $travel]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Travel  $travel
     * @return \Illuminate\Http\Response
     */
    public function destroy(Travel $travel)
    {
        $travel->delete();

        return response()->json(['status' => true, 'message' => 'success delete data']);
    }
}
