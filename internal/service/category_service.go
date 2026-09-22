package service

type CategoryService interface {
}

type categoryServiceImpl struct {
}

func NewCategoryService() CategoryService {
	return &categoryServiceImpl{}
}
