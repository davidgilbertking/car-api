<?php

namespace App\Http\Controllers;

use App\Models\Configuration;
use Illuminate\Http\Request;
use App\Http\Requests\StoreConfigurationRequest;
use App\Http\Requests\UpdateConfigurationRequest;

class ConfigurationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    /**
     * @OA\Get(
     *     path="/api/configurations",
     *     summary="Получить список всех конфигураций",
     *     tags={"Configurations"},
     *     @OA\Response(
     *         response=200,
     *         description="Список конфигураций",
     *         @OA\JsonContent(
     *             type="array",
     *             @OA\Items(
     *                 @OA\Property(property="id", type="integer", example=1),
     *                 @OA\Property(property="name", type="string", example="Comfort")
     *             )
     *         )
     *     )
     * )
     */
    public function index()
    {
        // ...
    }


    /**
     * Store a newly created resource in storage.
     */
    /**
     * @OA\Post(
     *     path="/api/configurations",
     *     summary="Создать новую конфигурацию",
     *     tags={"Configurations"},
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"name", "car_id"},
     *             @OA\Property(property="name", type="string", example="Luxury"),
     *             @OA\Property(property="car_id", type="integer", example=1)
     *         )
     *     ),
     *     @OA\Response(
     *         response=201,
     *         description="Конфигурация создана",
     *         @OA\JsonContent(
     *             @OA\Property(property="id", type="integer", example=3),
     *             @OA\Property(property="name", type="string", example="Luxury"),
     *             @OA\Property(property="car_id", type="integer", example=1)
     *         )
     *     )
     * )
     */
    public function store(StoreConfigurationRequest $request)
    {
        $configuration = Configuration::create($request->validated());

        return response()->json($configuration, 201);
    }



    /**
     * Display the specified resource.
     */
    /**
     * @OA\Get(
     *     path="/api/configurations/{id}",
     *     summary="Получить конфигурацию по ID",
     *     tags={"Configurations"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="ID конфигурации",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(
     *         response=200,
     *         description="Конфигурация найдена",
     *         @OA\JsonContent(
     *             @OA\Property(property="id", type="integer", example=1),
     *             @OA\Property(property="name", type="string", example="Comfort"),
     *             @OA\Property(property="car_id", type="integer", example=1)
     *         )
     *     ),
     *     @OA\Response(response=404, description="Конфигурация не найдена")
     * )
     */
    public function show(Configuration $configuration)
    {
        // ...
    }


    /**
     * Update the specified resource in storage.
     */
    /**
     * @OA\Put(
     *     path="/api/configurations/{id}",
     *     summary="Обновить конфигурацию",
     *     tags={"Configurations"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="ID конфигурации",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\RequestBody(
     *         required=true,
     *         @OA\JsonContent(
     *             required={"name", "car_id"},
     *             @OA\Property(property="name", type="string", example="Premium"),
     *             @OA\Property(property="car_id", type="integer", example=1)
     *         )
     *     ),
     *     @OA\Response(response=200, description="Конфигурация обновлена"),
     *     @OA\Response(response=404, description="Конфигурация не найдена")
     * )
     */
    public function update(UpdateConfigurationRequest $request, Configuration $configuration)
    {
        $configuration->update($request->validated());

        return response()->json($configuration);
    }



    /**
     * Remove the specified resource from storage.
     */
    /**
     * @OA\Delete(
     *     path="/api/configurations/{id}",
     *     summary="Удалить конфигурацию",
     *     tags={"Configurations"},
     *     @OA\Parameter(
     *         name="id",
     *         in="path",
     *         description="ID конфигурации",
     *         required=true,
     *         @OA\Schema(type="integer")
     *     ),
     *     @OA\Response(response=204, description="Конфигурация удалена"),
     *     @OA\Response(response=404, description="Конфигурация не найдена")
     * )
     */
    public function destroy(Configuration $configuration)
    {
        // ...
    }

}
