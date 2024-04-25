<script>
import AppLayout from '@/Layouts/AppLayout.vue';
import Welcome from '@/Components/Welcome.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';


export default {
    components: {
        AppLayout,
        Welcome,
    },

    props: ['districts', 'towns'],

    data() {
        return {
            form: useForm({
                name: '',
                town_id: null,
                number_of_clients: 0,
            }),
            selectedDistrict: null,
        }
    },

    methods: {
        submit() {
            if (this.selectedDistrict) {
                this.form.put(`districts/${this.selectedDistrict.id}`, {
                    onSuccess: () => {
                        this.form.reset();
                        this.selectedDistrict = null;
                        this.$emit('refresh');
                    }
                });
            } else {
                this.form.post('districts', {
                    onSuccess: () => {
                        this.form.reset();
                        this.$emit('refresh');
                    }
                });
            }
        },

        deleteTown(district) {
            this.$inertia.delete(`districts/${district.id}`, {
                onSuccess: () => {
                    this.$emit('refresh');
                }
            });
        },

        edit(district) {
            this.selectedDistrict = district;
            this.form.name = district.name;
            this.form.number_of_clients = district.number_of_clients;
            this.form.town_id = district.town_id;
        },


    }
}

</script>

<template>
    <AppLayout title="Dashboard">
        <header>
            <div class="container-fluid">
                <div class=" pt-6">
                    <div class="row align-items-center">
                        <div class="col-sm col-12">
                            <h1 class="h2 ls-tight">All Districts</h1>
                        </div>
                        <div class="col-sm-auto col-12 mt-4 mt-sm-0">
                            <div class="hstack gap-2 justify-content-sm-end"><a href="#offcanvasCreate"
                                    class="btn btn-sm btn-primary" data-bs-toggle="offcanvas"><span class="pe-2"><i
                                            class="bi bi-plus-square-dotted"></i> </span><span>Create</span></a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </header>
        <div class="offcanvas offcanvas-end w-full w-lg-1/3" data-bs-scroll="true" data-bs-backdrop="true" tabindex="-1"
            id="offcanvasCreate" aria-labelledby="offcanvasCreateLabel">
            <div class="offcanvas-header border-bottom py-4 bg-surface-secondary">
                <h5 class="offcanvas-title" id="offcanvasCreateLabel">{{ selectedDistrict ? 'Update' : 'New' }} District
                </h5><button type="button" class="btn-close text-reset text-xs" data-bs-dismiss="offcanvas"
                    aria-label="Close"></button>
            </div>
            <form @submit.prevent="submit()">

                <div class="offcanvas-body vstack gap-5">
                    <div class="row g-5">
                        <div class="col-md-6">
                            <div>
                                <label class="form-label">Name</label>
                                <input type="text" v-model="form.name" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div><label class="form-label">Select Town</label>
                                <select class="form-select" v-model="form.town_id" aria-label="Default select example">
                                    <option :value="district.id" v-for="district in towns">{{ district.name }}
                                    </option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <label class="form-label" for="last_name"># of Clients</label>
                            <input type="number" v-model="form.number_of_clients" class="form-control">

                        </div>
                    </div>
                    <div class="modal-footer py-2 bg-surface-secondary">
                        <button style="margin-right: 5px;" type="button" class="btn btn-sm btn-neutral"
                            data-bs-dismiss="offcanvas">Close</button>
                        <button style="margin-right: 5px;" type="submit" :class="{ 'opacity-25': form.processing }"
                            :disabled="form.processing" class="btn btn-sm btn-primary">Save</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="container-fluid mt-4">
            <div class="vstack gap-4">

                <div class="card">
                    <div class="card-header border-bottom d-flex align-items-center">
                        <h5 class="me-auto">All districts</h5>
                        <div class="dropdown"><a class="text-muted" href="#" role="button" data-bs-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false"><i class="bi bi-three-dots-vertical"></i></a>
                            <div class="dropdown-menu"><a href="#!" class="dropdown-item">Action </a><a href="#!"
                                    class="dropdown-item">Another action </a><a href="#!"
                                    class="dropdown-item">Something else here</a></div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-hover table-nowrap">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col">Name</th>
                                    <th scope="col">Clients</th>
                                    <th scope="col">Town</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="district in districts">
                                    <td>
                                        <a class="text-heading text-primary-hover font-semibold" href="#">

                                            {{ district.name }}
                                        </a>
                                    </td>

                                    <td>{{ district.number_of_clients }} households</td>
                                    <td>{{ district.town?.name }}</td>

                                    <td class="text-end">
                                        <a href="#offcanvasCreate" @click="edit(district)" data-bs-toggle="offcanvas"
                                            class="btn btn-sm btn-square btn-neutral"><i class="bi bi-pencil"></i>
                                        </a>

                                        <button type="button" @click="deleteTown(district)"
                                            class="btn btn-sm btn-square btn-neutral text-danger-hover"><i
                                                class="bi bi-trash"></i></button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-footer border-0 py-5"><span class="text-muted text-sm">Showing {{ districts.length
                            }} results found</span></div>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
