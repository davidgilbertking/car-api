<?php

namespace App\Http\Controllers;

use App\Models\Option;
use Illuminate\Http\Request;
use App\Http\Requests\StoreOptionRequest;
use App\Http\Requests\UpdateOptionRequest;

class OptionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    /**
     * @OA\Get(
     *     path="/api/options",
     *     summary="Получить список всех опций",
     *     tags={"Options"},
     *     @OA\Response(
     *         response=200,
     *         description="Список опций",
     *         @OA\JsonContent(
     *             type="array",
     *             @OA\Items(
     *                 @OA\Property(property="id", type="integer", example=1),
     *                 @OA\Property(property="name", type="string", example="Leather Seats")
     *             )
     *         )
     *     )
     * )
     */
    public function index()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    /**
     * @OA\Post(
     *     path="/api/options",
     *     summary="Создать новую опцию",
     *     tags={"Options"},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"name"},
     *             @OA\Property(property="name", type="string", example="Climate Control")
     *         )
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Опция создана",
     *         @OA\JsonContent(
     *             @OA\Property(property="id", type="integer", example=2),
     *             @OA\Property(property="name", type="string", example="Climate Control")
     *         )
     *     )
     * )
     */
    public function store(StoreOptionRequest $request)
    {
        $option = Option::create($request->validated());

        return response()->json($option, 201);
    }



    /**
     * Display the specified resource.
     */
    /**
     * @OA\Get(
     *     path="/api/options/{id}",
     *     summary="Получить одну опцию",
     *     tags={"Options"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="ID опции",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Опция найдена",
     *         @OA\JsonContent(
     *             @OA\Property(property="id", type="integer", example=1),
     *             @OA\Property(property="name", type="string", example="Sunroof")
     *         )
     *     ),
     *     @OA\Response(response=404, description="Опция не найдена")
     * )
     */
    public function show(Option $option)
    {
        // ...
    }


    /**
     * Update the specified resource in storage.
     */
    /**
     * @OA\Put(
     *     path="/api/options/{id}",
     *     summary="Обновить опцию",
     *     tags={"Options"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="ID опции",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             @OA\Property(property="name", type="string", example="Updated Option")
     *         )
     *     ),
     *     @OA\Response(response=200, description="Опция обновлена"),
     *     @OA\Response(response=404, description="Опция не найдена")
     * )
     */
    public function update(UpdateOptionRequest $request, Option $option)
    {
        $option->update($request->validated());

        return response()->json($option);
    }



    /**
     * Remove the specified resource from storage.
     */
    /**
     * @OA\Delete(
     *     path="/api/options/{id}",
     *     summary="Удалить опцию",
     *     tags={"Options"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="ID опции",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(response=204, description="Опция удалена"),
     *     @OA\Response(response=404, description="Опция не найдена")
     * )
     */
    public function destroy(Option $option)
    {
        // ...
    }

}
