<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StorePriceRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'configuration_id' => 'required|integer|exists:configurations,id',
            'price'            => 'required|numeric|min:0',
            'start_date'       => 'required|date',
            'end_date'         => 'nullable|date|after_or_equal:start_date',
        ];
    }
}
